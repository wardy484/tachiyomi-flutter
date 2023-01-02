import 'package:flutter/material.dart';

class SettingsAppbar extends StatelessWidget with PreferredSizeWidget {
  const SettingsAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: const Text("Settings"),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
