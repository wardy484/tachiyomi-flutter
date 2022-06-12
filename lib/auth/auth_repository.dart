import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttiyomi/auth/user.dart' as local_user;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

class AuthRepository {
  AuthRepository();

  Future<UserCredential> signInAnnonymously() async {
    return await FirebaseAuth.instance.signInAnonymously();
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  local_user.User getCurrentUser() {
    final user = FirebaseAuth.instance.currentUser;

    if (user is User) {
      return local_user.User.fromFirebaseUser(user);
    }

    throw Exception("User is not authenticated wtf");
  }
}
