import 'package:csen268_f24_g0/widgets/user_avatar_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/authentication/bloc/authentication_bloc.dart';

enum UserAvatarSize {
  small,
  medium,
  large,
}

class LoggedInUserAvatar extends StatelessWidget {
  const LoggedInUserAvatar({super.key, required this.userAvatarSize});
  final UserAvatarSize userAvatarSize;

  @override
  Widget build(BuildContext context) {
    late double radius;
    switch (userAvatarSize) {
      case UserAvatarSize.small:
        radius = 15;
        break;
      case UserAvatarSize.medium:
        radius = 25;
        break;
      case UserAvatarSize.large:
      default:
        radius = 40;
        break;
    }

    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        switch (state) {
          case AuthenticationSignedInState _:
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  UserAvatarImage(
                    user: state.user,
                    radius: radius,
                  ),
                  if (userAvatarSize == UserAvatarSize.large)
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Text(state.user.email,
                                maxLines: 1, overflow: TextOverflow.clip),
                          ),
                          if (state.user.emailVerified)
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Icon(
                                Icons.verified_user_outlined,
                              ),
                            )
                        ],
                      ),
                    ),
                ],
              ),
            );
          default:
            return Container();
        }
      },
    );
  }
}
