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
  final ReaderPageState? currentPageState;
  final int currentPage;
  final void Function(Chapter chapter) onChapterChanged;

  final showDebug = false;

  const ReaderBottomAppBar({
    Key? key,
    required this.mangaId,
    required this.chapter,
    required this.currentPageState,
    required this.currentPage,
    required this.onChapterChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final pages = ref.watch(readerPagesControllerProvider(mangaId));
    return AnimatedOpacity(
      opacity: ref.watch(readerAppbarControllerProvider) ? 1 : 0,
      duration: const Duration(milliseconds: 300),
      child: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showDebug)
              DebugBar(
                pages: pages,
                currentPage: currentPage,
                currentPageState: currentPageState,
              ),
            if (currentPageState != null &&
                currentPageState!.pageNumber > 0 &&
                currentPageState!.pageNumber <= currentPageState!.totalPages)
              ReaderProgressBar(currentPageState: currentPageState),
            Container(
              decoration: BoxDecoration(
                color:
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: Text(
                      "${currentPageState?.pageNumber ?? 0}/${currentPageState?.totalPages ?? 0}",
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
          ],
        ),
      ),
    );
  }
}

class ReaderProgressBar extends StatelessWidget {
  const ReaderProgressBar({
    Key? key,
    required this.currentPageState,
  }) : super(key: key);

  final ReaderPageState? currentPageState;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      tween: Tween<double>(
        begin: 0,
        end: currentPageState!.pageNumber /
            currentPageState!.totalPages.toDouble(),
      ),
      builder: (context, value, _) => LinearProgressIndicator(
        value: value,
      ),
    );
  }
}

class DebugBar extends StatelessWidget {
  const DebugBar({
    Key? key,
    required this.pages,
    required this.currentPage,
    required this.currentPageState,
  }) : super(key: key);

  final List<ReaderPageState> pages;
  final int currentPage;
  final ReaderPageState? currentPageState;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("DEBUG", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text("Total loaded pages: ${pages.length}"),
            const SizedBox(height: 4),
            Text("Current page: $currentPage"),
            const SizedBox(height: 4),
            Text(
                "Current Chapter total pages: ${currentPageState?.totalPages}"),
            const SizedBox(height: 4),
            Text("Current Chapter page: ${currentPageState?.pageNumber}"),
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
