import 'package:firebase_ui_auth/firebase_ui_auth.dart';
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
      body: SignInScreen(
        actions: [
          AuthStateChangeAction((context, state) {
            if (state is SignedIn && state.user != null) {
              ref.read(authNotifierProvider.notifier).onSignedIn(state);
              onLogin();
            }
          })
        ],
      ),
    );
  }
}
