import 'package:flutter/material.dart';
import 'package:fluttiyomi/update_queue/update_queue.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LibraryAppbar extends HookConsumerWidget with PreferredSizeWidget {
  const LibraryAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return AppBar(
      centerTitle: false,
      title: const Text("Library"),
      actions: ref.watch(updateQueueProvider).when(
            updating: (queue, total) => [
              // Center(
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Text("${queue.length}/$total"),
              //   ),
              // ),
              Center(
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
              const SizedBox(width: 16)
            ],
            updated: (_, __) => [],
          ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
