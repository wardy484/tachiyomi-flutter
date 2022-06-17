import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:fluttiyomi/auth/auth_notifier.dart';
import 'package:fluttiyomi/router.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authGuardProvider = Provider<AuthGuard>((ref) {
  return AuthGuard(
    authNotifier: ref.watch(authNotifierProvider.notifier),
  );
});

class AuthGuard extends AutoRouteGuard {
  final AuthNotifier _authNotifier;

  AuthGuard({
    required AuthNotifier authNotifier,
  })  : _authNotifier = authNotifier,
        super();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (_authNotifier.isLoggedIn()) {
      log('User is already authenticated');

      resolver.next(true);
    } else {
      log("User is not yet authenticated");

      router.push(
        LoginRoute(
          onLogin: () {
            log('Login successful');
            resolver.next();
          },
        ),
      );
    }
  }
}
