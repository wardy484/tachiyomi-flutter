import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttiyomi/router.gr.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      ListTile(
        leading: const Icon(Icons.book),
        title: const Text('Reader settings'),
        onTap: () => AutoRouter.of(context).push(const ReaderSettingsRoute()),
      ),
      ListTile(
        leading: const Icon(Icons.dashboard_customize),
        title: const Text('Source settings'),
        onTap: () => AutoRouter.of(context).push(const SourceSettingsRoute()),
      ),
      ListTile(
        leading: const Icon(Icons.person),
        title: const Text('Account'),
        onTap: () => AutoRouter.of(context).push(const AccountSettingsRoute()),
      ),
    ];

    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: menuItems.length,
      itemBuilder: (context, index) => menuItems[index],
    );
  }
}
