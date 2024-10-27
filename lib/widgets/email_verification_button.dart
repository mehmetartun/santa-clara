import 'package:santa_clara/blocs/authentication/bloc/authentication_bloc.dart';
import 'package:santa_clara/navigation/my_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EmailVerificationButton extends StatelessWidget {
  const EmailVerificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationSignedInState &&
            state.user.emailVerified != true) {
          return TextButton.icon(
              onPressed: () {
                GoRouter.of(context).goNamed(MyRoutes.verifyEmail.name);
              },
              icon: Icon(Icons.verified_outlined),
              label: Text("Verify Email"));
        } else {
          return Container();
        }
      },
    );
  }
}
