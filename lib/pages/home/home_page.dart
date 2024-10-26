import 'package:csen268_f24_g0/blocs/authentication/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
              child: FilledButton(
            child: Text("Sign Out"),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context)
                  .add(AuthenticationSignOutEvent());
            },
          ))
        ])));
  }
}
