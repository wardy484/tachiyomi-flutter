import 'package:flutter/material.dart';
import 'package:fluttiyomi/favourites/favourites_notifier.dart';
import 'package:fluttiyomi/widgets/common/refresh_icon_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LibraryAppbar extends HookConsumerWidget with PreferredSizeWidget {
  const LibraryAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return AppBar(
      centerTitle: false,
      title: const Text("Library"),
      actions: [
        RefreshIconButton(
          onPressed: () async {
            await ref.read(favouritesProvider.notifier).checkForUpdates();
          },
          alertMessage: "Check for updates",
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
