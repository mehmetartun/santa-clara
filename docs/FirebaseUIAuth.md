# FirebaseUIAuth

We use the package [firebase_ui_auth](https://pub.dev/packages/firebase_ui_auth) to create our sign in screen which gives us a lot of convenience:
- Signing in
- Forgot password
- Register

## SignInScreen

For signing in we utilize the `SignInScreen` from the [firebase_ui_auth](https://pub.dev/packages/firebase_ui_auth) in [sign_in_page.dart](/lib/pages/signIn/sign_in_page.dart). The `providers` property lists the method with which we allow logging in, namely email and password in this case. One would implement other providers here in future, like Google, Apple, etc. The user cannot go past this page unless the result is `AuthStateChangeAction<SignedIn>`. In this case we check if email is verified and redirect to the correct destination, i.e. `verifyEmail` or to `initialLocation`. 
```dart
class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: SignInScreen(
        providers: [EmailAuthProvider()],
        actions: [
          AuthStateChangeAction<SignedIn>((context, state) {
            if (!state.user!.emailVerified) {
              GoRouter.of(context).goNamed(RouteName.verifyEmail.name);
            } else {
              GoRouter.of(context).goNamed(IndexedRoutes().routes[0].name);
            }
          }),
        ],
      ),
    );
  }
}
```

## Notes
This package depends on [firebase_auth](https://pub.dev/packages/firebase_auth) package that exposes the Firebase Auth API to flutter. As it has only one instance, we can also access this through our `AuthenticationRepository`