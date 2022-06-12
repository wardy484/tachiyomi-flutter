import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  // ignore: unused_element
  const User._();

  factory User({
    required String id,
    required String providerId,
    String? email,
    String? name,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static User fromFirebaseUser(firebase_auth.User user) {
    return User(
      id: user.uid,
      providerId: "Idont care",
      email: user.email,
      name: user.displayName,
    );
  }
}
