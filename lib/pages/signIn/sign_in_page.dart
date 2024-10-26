import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../navigation/route_name.dart';

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
            // if (!state.user!.emailVerified) {
            //   GoRouter.of(context).goNamed(RouteName.verifyEmail.name);
            // } else {
            //   GoRouter.of(context).goNamed(IndexedRoutes().routes[0].name);
            // }
          }),
        ],
      ),
    );
  }
}
