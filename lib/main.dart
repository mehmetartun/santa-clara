import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:santa_clara/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_web_plugins/url_strategy.dart';

import 'blocs/authentication/bloc/authentication_bloc.dart';
import 'firebase_options.dart';
import 'navigation/router.dart';
import 'repositories/authentication/authentication_repository.dart';
import 'theme/cubit/theme_cubit.dart';
import 'theme/util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
  ]);
  Bloc.observer = AppBlocObserver();
  runApp(MyApp());
}

class AppBlocObserver extends BlocObserver {
  /// {@macro app_bloc_observer}
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) print(change);
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AuthenticationBloc authenticationBloc = AuthenticationBloc();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final brightness = View.of(context).platformDispatcher.platformBrightness;

    // Retrieves the default theme for the platform
    //TextTheme textTheme = Theme.of(context).textTheme;

    // Use with Google Fonts package to use downloadable fonts
    TextTheme textTheme =
        createTextTheme(context, "Roboto", "Playfair Display");

    MaterialTheme theme = MaterialTheme(textTheme);
    return RepositoryProvider(
      create: (context) {
        return AuthenticationRepository();
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              return authenticationBloc
                ..add(AuthenticationInitializeEvent(
                    authenticationRepository:
                        RepositoryProvider.of<AuthenticationRepository>(
                            context)));
              // return authenticationBloc..add(AuthenticationInitializeEvent());
            },
          ),
          BlocProvider(
            create: (context) => ThemeCubit(),
          ),
        ],
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {},
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp.router(
                title: 'Santa Clara',
                theme: theme.light(),
                darkTheme: theme.dark(),
                highContrastTheme: theme.lightHighContrast(),
                highContrastDarkTheme: theme.darkHighContrast(),
                themeMode: state.themeMode,
                routerConfig: router(authenticationBloc),
              );
            },
          ),
        ),
      ),
    );
  }
}
