import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttiyomi/reader/presentation/reader_pages_controller.dart';
import 'package:visibility_detector/visibility_detector.dart';

const visibilityThreadhold = 70;

class MangaPage extends StatefulWidget {
  final ReaderPage page;
  final void Function(ReaderPage page) onPageVisible;
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
    print("initState");
  }

  @override
  void didUpdateWidget(MangaPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    keepAlive = widget.keepAlive;
    updateKeepAlive();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.page.toKey()),
      child: CachedNetworkImage(
        imageUrl: widget.page.url,
        fit: BoxFit.fill,
      ),
      onVisibilityChanged: (info) {
        // Guard from unexpected crashes
        if (info.visibleFraction == 0) return;
        if (!_pageIsVisible(info)) return;

        widget.onPageVisible(widget.page);
      },
    );
  }

  @override
  bool get wantKeepAlive => keepAlive;

  bool _pageIsVisible(VisibilityInfo info) {
    return info.visibleFraction * 100 > visibilityThreadhold;
  }
}
