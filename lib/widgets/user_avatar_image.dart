import 'package:santa_clara/models/user.dart';
import 'package:flutter/material.dart';

class UserAvatarImage extends StatelessWidget {
  const UserAvatarImage({super.key, required this.user, this.radius});
  final User user;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      child: Text(
        user.displayName.isNotEmpty
            ? user.displayName[0].toUpperCase()
            : user.email[0].toUpperCase(),
      ),
    );
  }
}
