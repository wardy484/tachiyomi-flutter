import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttiyomi/chapter_updates/chapter_updates.dart';
import 'package:fluttiyomi/chapter_updates/models/chapter_update.dart';
import 'package:fluttiyomi/widgets/common/full_page_loading_indicator.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChapterUpdatesPage extends ConsumerStatefulWidget {
  const ChapterUpdatesPage({Key? key}) : super(key: key);

  @override
  _ChapterUpdatesPageState createState() => _ChapterUpdatesPageState();
}

class _ChapterUpdatesPageState extends ConsumerState<ChapterUpdatesPage> {
  @override
  void initState() {
    super.initState();

    ref.read(chapterUpdatesProvider.notifier).getChapterUpdates();
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(chapterUpdatesProvider).when(
          initial: () => const FullPageLoadingIndicator(),
          loaded: (chapterUpdatesList) {
            return GroupedListView<ChapterUpdate, DateTime>(
              elements: chapterUpdatesList.chapterUpdates,
              groupBy: (chapterUpdate) {
                return DateTime(
                  chapterUpdate.addedAt.year,
                  chapterUpdate.addedAt.month,
                  chapterUpdate.addedAt.day,
                );
              },
              itemComparator: (chapterUpdateA, chapterUpdateB) {
                return chapterUpdateA.addedAt.compareTo(chapterUpdateB.addedAt);
              },
              // groupComparator: (groupA, groupB) {
              //   if (groupA == "Today") {
              //     return -1;
              //   } else if (groupA == "Yesterday") {
              //     return 1;
              //   }

              //   return groupA.compareTo(groupB);
              // },
              groupSeparatorBuilder: (DateTime addedAt) {
                final now = DateTime.now();
                final today = DateTime(now.year, now.month, now.day);
                final yestereday = today.subtract(const Duration(days: 1));
                String dateString = "";

                if (addedAt.isAtSameMomentAs(today)) {
                  dateString = "Today";
                } else if (addedAt.isAtSameMomentAs(yestereday)) {
                  dateString = "Yesterday";
                } else {
                  dateString = timeago.format(addedAt);
                }

                return Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    top: 12,
                    bottom: 0,
                  ),
                  child: Text(
                    dateString,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
              itemBuilder: (context, chapterUpdate) {
                return ListTile(
                  textColor: chapterUpdate.read ? Colors.grey : Colors.white,
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: ExtendedImage.network(
                        chapterUpdate.imagePath,
                        cache: true,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(chapterUpdate.name),
                  subtitle: Text("Chapter ${chapterUpdate.chapterNumber}"),
                );
              },
              order: GroupedListOrder.DESC,
            );
          },
        );
  }

  @override
  void dispose() {
    ref.watch(chapterUpdatesProvider.notifier).closeStream();
    super.dispose();
  }
}
