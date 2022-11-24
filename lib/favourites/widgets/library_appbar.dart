import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttiyomi/router.gr.dart';
import 'package:fluttiyomi/update_queue/update_queue.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LibraryAppbar extends HookConsumerWidget with PreferredSizeWidget {
  const LibraryAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return AppBar(
      centerTitle: false,
      title: const Text("Library"),
      actions: [
        Row(
          children: [
            // TODO Make downloads page open from here
            // TODO: Add a badge to the downloads icon with a count of pending / downloading chapters
            // IconButton(
            //   icon: const Icon(FontAwesomeIcons.download),
            //   onPressed: () {
            //     // ref.read(updateQueueProvider.notifier).updateAll();/
            //   },
            //   iconSize: 20,
            // ),
            ref.watch(updateQueueProvider).when(
                  updating: (queue, total) => Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(
                          color: Colors.amber,
                          backgroundColor: Colors.grey,
                          value: (total.toDouble() - queue.length.toDouble()) /
                              total.toDouble(),
                        ),
                      ),
                    ),
                  ),
                  updated: (_, __) => Row(
                    children: [
                      IconButton(
                        icon: const Icon(FontAwesomeIcons.fire),
                        onPressed: () {
                          AutoRouter.of(context).push(
                            const ChaperUpdatesRoute(),
                          );
                        },
                        iconSize: 20,
                      ),
                    ],
                  ),
                ),
            const SizedBox(width: 8),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
