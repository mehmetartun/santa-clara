# Authentication Bloc
The `AuthenticationBloc` defined in [authentication_bloc.dart](/lib/blocs/authentication/bloc/authentication_bloc.dart) does the event handling for authentiction events. 

On the one side, it creates a connection to the `AuthenticationRepository` subscribing to the `AuthUser` stream. Based on the state of the `AuthUser` it emits `AuthenticationState`s:
```dart
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitialState()) {
    on<AuthenticationInitializeEvent>((event, emit) {
      init(event, emit);
    });
    ... // define handlers for each event
  }
  late final AuthenticationRepository authenticationRepository;
  User? user;
  StreamSubscription<AuthUser>? authUserStreamSubscription;

  void init(AuthenticationInitializeEvent event, emit) {
    authenticationRepository = event.authenticationRepository;
    authUserStreamSubscription =
        authenticationRepository.authUserStream.listen((AuthUser authUser) {
            ...  // Handle changes
    });
  }

  void signOut(event, emit) {
    ... // Handle sign out request
  }

  void updateUser(AuthUser authUser) {
    ... // Update internal user based on changed AuthUser
  }

  @override
  Future<void> close() {
    authUserStreamSubscription?.cancel();
    return super.close();
  }
}
```
The `init()` method initializes the bloc by creating a **subscription** to the `AuthUser` stream of the `AuthenticationRepository`. This way, any changes to the authentication state are captured and the `AuthenticationBloc` can then take the necessary actions. 

## Important - close stream subscription
Here we can see that the stream subscription to the `AuthUser` stream needs to be cancelled upon closing of the bloc by providing the **override** for the `close()` method of the `Bloc`.