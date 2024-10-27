import 'dart:async';

import 'package:santa_clara/models/auth_user.dart';
import 'package:santa_clara/models/user.dart';
import 'package:santa_clara/repositories/authentication/authentication_repository.dart';
import 'package:santa_clara/services/mock/mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitialState()) {
    on<AuthenticationEvent>((event, emit) {
      // TODO: implement event handler - this is the abstract class
    });
    on<AuthenticationInitializeEvent>((event, emit) {
      init(event, emit);
    });
    on<AuthenticationSignOutEvent>((event, emit) {
      signOut(event, emit);
    });
    on<AuthenticationSignInEvent>((event, emit) {
      // Implement manual sign in (away from FirebaseUIAuth package)
    });
    on<AuthenticationSignedInEvent>((event, emit) {
      emit(AuthenticationSignedInState(user: user!));
    });
    on<AuthenticationSignedOutEvent>((event, emit) {
      emit(AuthenticationNotSignedInState());
    });
    on<AuthenticationEmailVerificationRequest>((event, emit) {
      verifyEmail(event, emit);
    });
    on<AuthenticationEmailVerificationScreenEvent>((event, emit) {
      emit(AuthenticationEmailVerificationScreenState());
    });
    on<AuthenticationEmailVerificationCancelRequest>((event, emit) {
      emit(AuthenticationSignedInState(user: user!));
    });
  }
  late final AuthenticationRepository authenticationRepository;
  User? user;
  StreamSubscription<AuthUser>? authUserStreamSubscription;

  void init(AuthenticationInitializeEvent event, emit) {
    authenticationRepository = event.authenticationRepository;
    authUserStreamSubscription =
        authenticationRepository.authUserStream.listen((AuthUser authUser) {
      if (authUser.isNull || authUser.email == null || authUser.uid == null) {
        add(AuthenticationSignedOutEvent());
      } else {
        updateUser(authUser);
      }
    });
  }

  void signOut(event, emit) {
    emit(AuthenticationNotSignedInState());
    user = null;
    authenticationRepository.signOut();
  }

  void updateUser(AuthUser authUser) {
    user = User(
      email: authUser.email!,
      uid: authUser.uid!,
      displayName: authUser.displayName ?? "",
      imageUrl: authUser.imageUrl ?? Mock.imageUrl(),
      emailVerified: authUser.emailVerified ?? false,
    );
    if (user!.emailVerified) {
      add(AuthenticationSignedInEvent());
    } else {
      add(AuthenticationEmailVerificationScreenEvent());
    }
  }

  void verifyEmail(event, emit) {
    emit(AuthenticationVerifyEmailState());
    authenticationRepository.verifyEmail(user?.email);
  }

  @override
  Future<void> close() {
    authUserStreamSubscription?.cancel();
    return super.close();
  }
}
