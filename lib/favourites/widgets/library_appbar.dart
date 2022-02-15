import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttiyomi/favourites/favourites_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LibraryAppbar extends HookConsumerWidget with PreferredSizeWidget {
  const LibraryAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final controller = useAnimationController(
      duration: const Duration(seconds: 2),
    ); // start the animation

    return AppBar(
      centerTitle: false,
      title: const Text("Library"),
      actions: [
        // IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.search),
        // ),
        AnimatedBuilder(
          animation: controller,
          child: IconButton(
            onPressed: () async {
              controller.repeat();
              await ref.read(favouritesProvider.notifier).checkForUpdates();
              controller.forward();
            },
            icon: const Icon(Icons.refresh),
          ),
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationZ(2 * pi * controller.value),
              child: child,
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
