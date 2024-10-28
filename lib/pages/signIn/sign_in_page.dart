import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:santa_clara/pages/signIn/sign_in_header.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: SignInScreen(
        headerBuilder: (context, constraints, shrinkOffset) => SignInHeader(),
        providers: [EmailAuthProvider()],
        actions: [
          AuthStateChangeAction<SignedIn>((context, state) {}),
        ],
      ),
    );
  }
}
