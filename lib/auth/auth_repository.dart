import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
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
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser =
          await GoogleSignIn().signIn().catchError((error, stackTrace) => null);

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance
          .signInWithCredential(credential)
          .catchError((error, stackTrace) {
        log("Error authenticating");
      });
    } catch (e) {
      if (e is PlatformException) {
        switch (e.code) {
          case 'sign_in_cancelled':
            break;
          default:
            throw Exception("Unable to login");
        }
      }

      throw Exception("Unable to login");
    }
  }

  local_user.User getCurrentUser() {
    final user = FirebaseAuth.instance.currentUser;

    if (user is User) {
      return local_user.User.fromFirebaseUser(user);
    }

    throw Exception("User is not authenticated wtf");
  }
}
