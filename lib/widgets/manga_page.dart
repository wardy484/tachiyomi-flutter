import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttiyomi/reader/presentation/reader_pages_controller.dart';
import 'package:visibility_detector/visibility_detector.dart';

const visibilityThreadhold = 70;

class MangaPage extends StatelessWidget {
  final ReaderPage page;
  final void Function(ReaderPage page) onPageVisible;

  const MangaPage({
    Key? key,
    required this.page,
    required this.onPageVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(page.toKey()),
      child: CachedNetworkImage(
        imageUrl: page.url,
        fit: BoxFit.fill,
      ),
      onVisibilityChanged: (info) {
        // Guard from unexpected crashes
        if (info.visibleFraction == 0) return;
        if (!_pageIsVisible(info)) return;

        onPageVisible(page);
      },
    );
  }

  bool _pageIsVisible(VisibilityInfo info) {
    return info.visibleFraction * 100 > visibilityThreadhold;
  }
}
