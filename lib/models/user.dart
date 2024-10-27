// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:santa_clara/services/mock/mock.dart';

class User {
  final String displayName;
  final String email;
  final String imageUrl;
  final String uid;
  final bool emailVerified;

  User({
    required this.displayName,
    required this.email,
    required this.imageUrl,
    required this.uid,
    required this.emailVerified,
  });

  User copyWith({
    String? displayName,
    String? email,
    String? imageUrl,
    String? uid,
    bool? emailVerified,
  }) {
    return User(
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      uid: uid ?? this.uid,
      emailVerified: emailVerified ?? this.emailVerified,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'displayName': displayName,
      'email': email,
      'imageUrl': imageUrl,
      'uid': uid,
      'emailVerified': emailVerified,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      displayName: map['displayName'] as String,
      email: map['email'] as String,
      imageUrl: map['imageUrl'] as String,
      uid: map['uid'] as String,
      emailVerified: map['emailVerified'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  static User createMockUser() {
    return User(
      displayName: Mock.displayName(),
      email: Mock.email(),
      imageUrl: Mock.imageUrl(),
      uid: Mock.uid(),
      emailVerified: true,
    );
  }

  @override
  String toString() {
    return 'User(displayName: $displayName,  email: $email, imageUrl: $imageUrl, uid: $uid, verified: $emailVerified)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.displayName == displayName &&
        other.email == email &&
        other.imageUrl == imageUrl &&
        other.uid == uid &&
        other.emailVerified == emailVerified;
  }

  @override
  int get hashCode {
    return displayName.hashCode ^
        email.hashCode ^
        imageUrl.hashCode ^
        uid.hashCode;
  }
}
