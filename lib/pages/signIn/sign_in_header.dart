import 'package:flutter/material.dart';

class SignInHeader extends StatelessWidget {
  const SignInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: 100,
      height: 100,
      child: Image.asset("assets/icons/launcher_icon.png"),
    );
  }
}
