import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

extension _FPS on Duration {
  double get fps => (1000 / inMilliseconds);
}

class FPSWidget extends StatefulWidget {
  final Widget child;
  final Alignment alignment;
  final bool show;

  const FPSWidget({
    Key? key,
    required this.child,
    this.show = true,
    this.alignment = Alignment.topRight,
  }) : super(key: key);

  @override
  _FPSWidgetState createState() => _FPSWidgetState();
}

class _FPSWidgetState extends State<FPSWidget> {
  Duration? prev;
  List<Duration> timings = [];
  double width = 150;
  double height = 100;
  late int framesToDisplay = width ~/ 5;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(update);
    super.initState();
  }

  update(Duration duration) {
    setState(() {
      if (prev != null) {
        timings.add(duration - prev!);
        if (timings.length > framesToDisplay) {
          timings = timings.sublist(timings.length - framesToDisplay - 1);
        }
      }

      prev = duration;
    });

    if (mounted) {
      SchedulerBinding.instance.addPostFrameCallback(update);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: widget.alignment,
      children: [
        widget.child,
        if (widget.show)
          Directionality(
            textDirection: TextDirection.ltr,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 8.0,
                bottom: 8.0,
                top: 30.0,
                left: 8.0,
              ),
              child: Text(
                "FPS: ${timings.last.fps.toStringAsFixed(0)}",
                style: const TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 16,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
