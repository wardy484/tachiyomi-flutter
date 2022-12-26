import 'package:flutter/material.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/reader/presentation/reader_appbar.dart';

class ReaderErrorContent extends StatelessWidget {
  final Chapter chapter;
  final String? message;

  const ReaderErrorContent({
    Key? key,
    required this.chapter,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: Colors.black,
      appBar: ReaderAppBar(chapter: chapter),
      body: Expanded(
        child: Center(
          child: Column(
            children: [
              const Text('Something went wrote loading this chapter'),
              Text("Error: $message"),
            ],
          ),
        ),
      ),
    );
  }
}
