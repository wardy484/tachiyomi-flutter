import 'package:flutter/material.dart';
import '../provider/provider.dart';

/// {@template chapter_updates_body}
/// Body of the ChapterUpdatesPage.
///
/// Add what it does
/// {@endtemplate}
class ChapterUpdatesBody extends ConsumerWidget {
  /// {@macro chapter_updates_body}
  const ChapterUpdatesBody({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(chapterUpdatesProvider);
    return Text(count.toString());
  }  
}
