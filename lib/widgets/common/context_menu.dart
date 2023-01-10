import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ContextMenu extends ConsumerWidget {
  final List<ContextMenuItem> children;

  const ContextMenu({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Animate(
      effects: const [
        SlideEffect(
          duration: Duration(milliseconds: 200),
          begin: Offset(0, 0.3),
          end: Offset.zero,
        ),
      ],
      child: Dialog(
        alignment: Alignment.bottomCenter,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: children,
          ),
        ),
      ),
    );
  }
}

class ContextMenuItem extends ConsumerWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const ContextMenuItem({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        iconSize: 30,
        onPressed: () {
          onPressed();

          Navigator.pop(context);
        },
        icon: FaIcon(icon),
      ),
    );
  }
}
