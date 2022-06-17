import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttiyomi/auth/auth_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends ConsumerWidget {
  final void Function() onLogin;

  const LoginPage({
    Key? key,
    required this.onLogin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Theme.of(context).colorScheme.primary,
              child: const Text(
                "Login with Google",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                try {
                  await ref
                      .read(authNotifierProvider.notifier)
                      .signInWithGoogle();

                  onLogin();
                } catch (e) {
                  log("Auth error: $e");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
