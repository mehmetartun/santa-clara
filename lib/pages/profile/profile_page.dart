import 'package:csen268_f24_g0/widgets/logged_in_user_avatar.dart';
import 'package:csen268_f24_g0/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey key = GlobalKey();
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(title: Text("Profile"), actions: [
          LoggedInUserAvatar(
            userAvatarSize: UserAvatarSize.small,
          )
        ]),
        body: Center(child: Text("Profile")));
  }
}
