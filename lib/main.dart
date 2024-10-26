import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csen268_f24_g0/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/authentication/bloc/authentication_bloc.dart';
import 'firebase_options.dart';
import 'navigation/router.dart';
import 'repositories/authentication/authentication_repository.dart';
import 'theme/cubit/theme_cubit.dart';
import 'theme/util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
        child: MultiBlocListener(
          listeners: [
            BlocListener<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                // TODO: implement listener
              },
            ),
          ],
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp.router(
                title: 'Flutter Demo',
                theme: theme.light(),
                darkTheme: theme.dark(),
                highContrastTheme: theme.lightHighContrast(),
                highContrastDarkTheme: theme.darkHighContrast(),
                themeMode: state.themeMode,

                // theme: ThemeData(
                //   // This is the theme of your application.
                //   //
                //   // TRY THIS: Try running your application with "flutter run". You'll see
                //   // the application has a purple toolbar. Then, without quitting the app,
                //   // try changing the seedColor in the colorScheme below to Colors.green
                //   // and then invoke "hot reload" (save your changes or press the "hot
                //   // reload" button in a Flutter-supported IDE, or press "r" if you used
                //   // the command line to start the app).
                //   //
                //   // Notice that the counter didn't reset back to zero; the application
                //   // state is not lost during the reload. To reset the state, use hot
                //   // restart instead.
                //   //
                //   // This works for code too, not just values: Most code changes can be
                //   // tested with just a hot reload.
                //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                //   useMaterial3: true,
                // ),
                routerConfig: router(authenticationBloc),
              );
            },
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    FirebaseFirestore.instance.collection("test").add({'name': 'uoko'});
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In")),
      body: SignInScreen(
        providers: [EmailAuthProvider()],
        actions: [
          AuthStateChangeAction<SignedIn>((context, state) {
            if (!state.user!.emailVerified) {
              print("Email is not verified for this user");
              // Navigator.pushNamed(context, '/verify-email');
              print(state.user?.email);
            } else {
              print("Email is verified for this user");
              //Navigator.pushReplacementNamed(context, '/profile');
            }
          }),
        ],
        styles: const {
          EmailFormStyle(signInButtonVariant: ButtonVariant.filled),
        },
        subtitleBuilder: (context, action) {
          final actionText = switch (action) {
            AuthAction.signIn => 'Please sign in to continue.',
            AuthAction.signUp => 'Please create an account to continue',
            _ => throw Exception('Invalid action: $action'),
          };

          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text('Welcome to Firebase UI! $actionText.'),
          );
        },
        footerBuilder: (context, action) {
          final actionText = switch (action) {
            AuthAction.signIn => 'signing in',
            AuthAction.signUp => 'registering',
            _ => throw Exception('Invalid action: $action'),
          };

          return Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                'By $actionText, you agree to our terms and conditions.',
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          );
        },
      ),
    );
  }
}
