import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttiyomi/favourites/presentation/favourite_updates_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavouritesAppbar extends HookConsumerWidget with PreferredSizeWidget {
  const FavouritesAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final updateQueue = ref.watch(favouriteUpdateQueueControllerProvider);
    final total = updateQueue.maxItems.toDouble();
    final progress = total - updateQueue.items.length.toDouble();

    return AppBar(
      centerTitle: false,
      title: const Text("Library"),
      actions: [
        Row(
          children: [
            if (total > 0)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(
                      color: Colors.amber,
                      backgroundColor: Colors.grey,
                      value: (progress) / total,
                    ),
                  ),
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
