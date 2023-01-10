import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttiyomi/reader/presentation/reader_pages_controller.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MangaPage extends StatefulWidget {
  final ReaderPageState page;
  final void Function(ReaderPageState page) onPageVisible;
  final bool keepAlive;

  const MangaPage({
    Key? key,
    required this.page,
    required this.onPageVisible,
    required this.keepAlive,
  }) : super(key: key);

  @override
  State<MangaPage> createState() => _MangaPageState();
}

class _MangaPageState extends State<MangaPage>
    with AutomaticKeepAliveClientMixin {
  bool keepAlive = true;

  @override
  void initState() {
    super.initState();
    keepAlive = widget.keepAlive;
  }

  @override
  void didUpdateWidget(MangaPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    keepAlive = widget.keepAlive;
    updateKeepAlive();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return VisibilityDetector(
      key: Key(widget.page.toKey()),
      child: CachedNetworkImage(
        imageUrl: widget.page.url,
        fit: BoxFit.fill,
      ),
      onVisibilityChanged: (info) {
        // Guard from unexpected crashes
        if (info.visibleFraction == 0) {
          return;
        }

        if (!_pageIsVisible(info)) {
          return;
        }

        widget.onPageVisible(widget.page);
      },
    );
  }

  @override
  bool get wantKeepAlive => keepAlive;

  bool _pageIsVisible(VisibilityInfo info) {
    final double viewportHeight = MediaQuery.of(context).size.height;
    final double imageHeight = info.size.height;
    final double visibleHeight =
        (imageHeight - viewportHeight).clamp(0.0, imageHeight) +
            info.visibleFraction * viewportHeight;
    final double visibleFraction = visibleHeight / viewportHeight;
    return visibleFraction >= 0.7;
  }
}
