import 'package:csen268_f24_g0/blocs/authentication/bloc/authentication_bloc.dart';
import 'package:csen268_f24_g0/repositories/authentication/authentication_repository.dart';
import 'package:csen268_f24_g0/utilities/stream_to_listenable.dart';
import 'package:csen268_f24_g0/widgets/scaffold_with_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../pages/home/home_page.dart';
import '../pages/signIn/sign_in_page.dart';
import '../pages/verifyEmail/verify_email_page.dart';
import 'route_name.dart';

List<GoRoute> shellRoutes =
    List.generate(IndexedRoutes().routes.length, (index) {
  return GoRoute(
    name: IndexedRoutes().routes[index].name,
    path: IndexedRoutes().routes[index].path,
    builder: (context, state) {
      return IndexedRoutes().routes[index].child ?? Container();
    },
  );
});

GoRouter router(AuthenticationBloc authenticationBloc) {
  final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: "Root");
  final GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: "Shell");
  return GoRouter(
      // initialLocation: IndexedRoutes().routes[0].name,
      navigatorKey: rootNavigatorKey,
      // initialLocation: RouteName.home.path + IndexedRoutes().routes[0].path,
      initialLocation: "/images",
      refreshListenable: StreamToListenable([authenticationBloc.stream]),
      redirect: (context, state) {
        if (BlocProvider.of<AuthenticationBloc>(context).state
            is! AuthenticationSignedInState) {
          return RouteName.signIn.path;
        }
        if (state.fullPath?.startsWith(RouteName.verifyEmail.path) ?? false) {
          if (BlocProvider.of<AuthenticationBloc>(context).state
              is AuthenticationSignedInState) {
            if (RepositoryProvider.of<AuthenticationRepository>(context)
                    .getCurrentUser()
                    .emailVerified ??
                false) {
              return null;
            } else {
              return RouteName.verifyEmail.path;
            }
          }
        }
        return null;
      },
      routes: [
        GoRoute(
          name: RouteName.home.name,
          path: RouteName.home.path,
          builder: (context, state) => HomePage(),
          routes: [
            ShellRoute(
              navigatorKey: shellNavigatorKey,
              routes: shellRoutes,
              builder: (context, state, child) {
                return ScaffoldWithNavBar(
                  child: child,
                );
              },
            )
          ],
        ),
        GoRoute(
          name: RouteName.verifyEmail.name,
          path: RouteName.verifyEmail.path,
          builder: (context, state) => VerifyEmailPage(),
        ),
        GoRoute(
          name: RouteName.signIn.name,
          path: RouteName.signIn.path,
          builder: (context, state) => SignInPage(),
        ),
      ]);
}
