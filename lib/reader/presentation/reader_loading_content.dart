import 'package:flutter/material.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/reader/presentation/reader_appbar.dart';
import 'package:fluttiyomi/widgets/common/full_page_loading_indicator.dart';

class ReaderLoadingContent extends StatelessWidget {
  final Chapter chapter;

  const ReaderLoadingContent({
    Key? key,
    required this.chapter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: Colors.black,
      appBar: ReaderAppBar(chapter: chapter),
      body: const FullPageLoadingIndicator(),
    );
  }
}
