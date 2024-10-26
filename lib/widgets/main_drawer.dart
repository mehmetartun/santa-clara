import 'package:csen268_f24_g0/blocs/authentication/bloc/authentication_bloc.dart';
import 'package:csen268_f24_g0/widgets/brightness_selector.dart';
import 'package:csen268_f24_g0/widgets/email_verification_button.dart';
import 'package:csen268_f24_g0/widgets/logged_in_user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({super.key, this.navigationItems});
  final List<Widget>? navigationItems;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: key,
      child: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            DrawerHeader(
              child: Container(
                width: double.infinity,
                height: 400,
                child: LoggedInUserAvatar(
                  userAvatarSize: UserAvatarSize.large,
                ),
              ),
            ),
            if (navigationItems != null) ...navigationItems!,
            TextButton.icon(
                icon: Icon(Icons.question_mark),
                label: Text("Other"),
                onPressed: () {}),
            TextButton.icon(
                icon: Icon(Icons.question_mark),
                label: Text("Other"),
                onPressed: () {}),
            TextButton.icon(
                icon: Icon(Icons.question_mark),
                label: Text("Other"),
                onPressed: () {}),
            EmailVerificationButton(),
            TextButton.icon(
                icon: Icon(Icons.logout),
                label: Text("Sign Out"),
                onPressed: () {
                  BlocProvider.of<AuthenticationBloc>(context)
                      .add(AuthenticationSignOutEvent());
                }),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text("Display settings",
                  style: Theme.of(context).textTheme.labelMedium),
            ),
            BrightnessSelector(),
          ]),
        )),
      ),
    );
  }
}
