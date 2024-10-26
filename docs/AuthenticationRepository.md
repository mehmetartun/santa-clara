# Authentication Repository
To abstract our code from direct implementation of an external service like Firebase Auth, we create an authentication repository that interfaces with Firebase.

In [authentication_repository.dart](lib/repositories/authentication/authentication_repository.dart) we create `signOut()` and `getCurrentUser()` methods corresponding to the same in the [firebase_auth](https://pub.dev/packages/firebase_auth) package. 

In addition, we also convert the `authStateChanges()` stream of the Firebase Auth API, to a stream of `AuthUser` objects that we created. 
```dart
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
```
The `AuthUser` is defined in [auth_user.dart](../lib/models/auth_user.dart) which contains the key parameters of the user returned from Firebase.
