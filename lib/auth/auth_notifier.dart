import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:fluttiyomi/auth/auth_repository.dart';
import 'package:fluttiyomi/auth/auth_state.dart' as auth_state;
import 'package:fluttiyomi/auth/user.dart' as auth_user;
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, auth_state.AuthState>(
  (ref) => AuthNotifier(
    auth: ref.read(authRepositoryProvider),
  ),
);

class AuthNotifier extends StateNotifier<auth_state.AuthState> {
  final AuthRepository auth;

  AuthNotifier({
    required this.auth,
  }) : super(const auth_state.AuthState.unauthenticated());

  Future<void> signInAnnonymously() async {
    final credentials = await auth.signInAnnonymously();
    final user = credentials.user;

    if (user != null) {
      state = auth_state.AuthState.authenticated(
        auth_user.User(id: user.uid, providerId: "annonymous"),
      );
    }
  }

  Future<void> signInWithGoogle() async {
    final credentials = await auth.signInWithGoogle();
    final user = credentials.user;

    if (user != null) {
      state = auth_state.AuthState.authenticated(
        auth_user.User(
          id: user.uid,
          providerId: "Google",
          email: user.email,
          name: user.displayName,
        ),
      );
    }
  }

  void onSignedIn(SignedIn state) {
    final user = state.user;

    if (user != null) {
      this.state = auth_state.AuthState.authenticated(
        auth_user.User(
          id: user.uid,
          providerId: "Google",
          email: user.email,
          name: user.displayName,
        ),
      );
    }
  }

  bool isLoggedIn() {
    return state.when(
      unauthenticated: () {
        final user = FirebaseAuth.instance.currentUser;

        if (user != null) {
          return true;
        }

        return false;
      },
      authenticated: (_) => true,
    );
  }
}
