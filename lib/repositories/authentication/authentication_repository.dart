import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:santa_clara/models/auth_user.dart';

class AuthenticationRepository {
  AuthUser getCurrentUser() {
    auth.User? authUser = auth.FirebaseAuth.instance.currentUser;

    if (authUser == null) {
      return AuthUser();
    } else {
      return AuthUser(
        displayName: authUser.displayName,
        email: authUser.email,
        imageUrl: authUser.photoURL,
        uid: authUser.uid,
        emailVerified: authUser.emailVerified,
      );
    }
  }

  Future<void> signOut() async {
    await auth.FirebaseAuth.instance.signOut();
  }

  Future<void> verifyEmail(String? email) async {
    await auth.FirebaseAuth.instance.currentUser?.sendEmailVerification();
    await auth.FirebaseAuth.instance.signOut();
  }

  Stream<AuthUser> get authUserStream async* {
    await for (final user in auth.FirebaseAuth.instance.authStateChanges()) {
      if (user == null) {
        yield AuthUser();
      } else {
        yield AuthUser(
          email: user.email,
          uid: user.uid,
          imageUrl: user.photoURL,
          displayName: user.displayName,
          emailVerified: user.emailVerified,
        );
      }
    }
  }
}
