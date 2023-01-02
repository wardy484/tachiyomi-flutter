import 'package:flutter/material.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/reader/presentation/reader_appbar_controller.dart';
import 'package:fluttiyomi/reader/presentation/reader_pages_controller.dart';
import 'package:fluttiyomi/reader/presentation/reader_progress_controller.dart';
import 'package:fluttiyomi/settings/presentation/settings_controller.dart';
import 'package:fluttiyomi/settings/presentation/settings_tab.dart';
import 'package:fluttiyomi/widgets/common/full_page_loading_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReaderBottomAppBar extends ConsumerWidget {
  final String mangaId;
  final Chapter chapter;
  final int numberOfPages;
  final int currentPage;
  final void Function(Chapter chapter) onChapterChanged;

  const ReaderBottomAppBar({
    Key? key,
    required this.mangaId,
    required this.numberOfPages,
    required this.chapter,
    required this.currentPage,
    required this.onChapterChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    int totalPages = ref.watch(readerPagesControllerProvider(mangaId)).length;

    return AnimatedOpacity(
      opacity: ref.watch(readerAppbarControllerProvider) ? 1 : 0,
      duration: const Duration(milliseconds: 300),
      child: BottomAppBar(
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Text(
                "$currentPage/$totalPages",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    final newChapter = ref
                        .read(readerUpcomingChaptersControllerProvider(
                          mangaId,
                          chapter,
                        ))
                        .previousChapter;

                    if (newChapter != null) {
                      onChapterChanged(newChapter);
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    final newChapter = ref
                        .read(readerUpcomingChaptersControllerProvider(
                          mangaId,
                          chapter,
                        ))
                        .nextChapter;

                    if (newChapter != null) {
                      onChapterChanged(newChapter);
                    }
                  },
                ),
              ],
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.gear, size: 20),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => const SettingsBottomSheet(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsBottomSheet extends ConsumerWidget {
  const SettingsBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Settings",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ref.watch(settingsControllerProvider).maybeWhen(
                orElse: () => const FullPageLoadingIndicator(),
                data: (settings) {
                  return SettingsForm(settings: settings);
                }),
          ],
        ),
      ),
    );
  }
}
