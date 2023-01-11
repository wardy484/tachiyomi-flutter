import 'package:flutter/material.dart';
import 'package:fluttiyomi/auth/auth_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountSettingsPage extends HookConsumerWidget {
  const AccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ref.watch(authNotifierProvider).when(
              unauthenticated: () =>
                  const Text("Unauthenticated - somethings gone wrong."),
              authenticated: (user) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Provider: ${user.providerId}"),
                  const SizedBox(height: 8),
                  Text("Name: ${user.name}"),
                  const SizedBox(height: 8),
                  Text("Email: ${user.email}"),
                ],
              ),
            ),
      ),
    );
  }
}
