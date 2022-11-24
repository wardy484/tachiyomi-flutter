import 'package:flutter/material.dart';
import 'package:fluttiyomi/chapter_updates/chapter_updates.dart';

class ChaperUpdatesPage extends StatelessWidget {
  const ChaperUpdatesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chapter Updates"),
      ),
      body: const ChapterUpdatesList(),
    );
  }
}
