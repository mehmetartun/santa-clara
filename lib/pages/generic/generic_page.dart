import 'package:csen268_f24_g0/widgets/logged_in_user_avatar.dart';
import 'package:csen268_f24_g0/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class GenericPage extends StatelessWidget {
  const GenericPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), actions: [
        LoggedInUserAvatar(
          userAvatarSize: UserAvatarSize.small,
        )
      ]),
      body: Center(
        child: Text(title),
      ),
      drawer: MainDrawer(),
    );
  }
}
