import 'package:csen268_f24_g0/navigation/route_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify Email"),
      ),
      body: EmailVerificationScreen(
        // actionCodeSettings: ActionCodeSettings(...),
        actions: [
          // EmailVerifiedAction(() {
          //   GoRouter.of(context).goNamed(IndexedRoutes().routes[0].name);
          //   //Navigator.pushReplacementNamed(context, '/profile');
          // }),
          AuthCancelledAction((context) {
            // FirebaseUIAuth.signOut(context: context);
            // Navigator.pushReplacementNamed(context, '/');
            GoRouter.of(context).goNamed(IndexedRoutes().routes[0].name);
          }),
        ],
      ),
    );
  }
}
