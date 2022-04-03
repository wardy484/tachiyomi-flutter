import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LibraryAppbar extends HookConsumerWidget with PreferredSizeWidget {
  const LibraryAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return AppBar(
      centerTitle: false,
      title: const Text("Library"),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
