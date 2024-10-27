import 'package:santa_clara/blocs/authentication/bloc/authentication_bloc.dart';
import 'package:santa_clara/navigation/my_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool busy = false;
  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc bloc =
        BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Email Verification"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Email not verified",
                  style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: 10),
              Text(
                  "Your email is not verified. Please click below to receive an "
                  "email at your email address."),
              SizedBox(height: 10),
              Text("Note that you will be logged out and redirected "
                  "to Sign In for the changes to take effect."),
              SizedBox(height: 10),
              AnimatedCrossFade(
                crossFadeState:
                    busy ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration: Duration(milliseconds: 300),
                firstChild: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(20),
                  child: CircularProgressIndicator(),
                ),
                secondChild: Container(),
              ),
              Container(
                width: double.infinity,
                child: FilledButton(
                    onPressed: busy
                        ? null
                        : () {
                            bloc.add(AuthenticationEmailVerificationRequest());
                            setState(() {
                              busy = true;
                            });
                          },
                    child: Text("Verify Email")),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 10),
                child: FilledButton.tonal(
                    onPressed: busy
                        ? null
                        : () {
                            BlocProvider.of<AuthenticationBloc>(context).add(
                                AuthenticationEmailVerificationCancelRequest());
                            Future.delayed(Duration(milliseconds: 10), () {
                              GoRouter.of(context)
                                  .goNamed(IndexedRoutes().routes[0].name);
                            });
                            setState(() {
                              busy = true;
                            });
                          },
                    child: Text("I'll do it later")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
