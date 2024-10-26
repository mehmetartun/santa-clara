import 'dart:async';

import 'package:csen268_f24_g0/models/user.dart';
import 'package:csen268_f24_g0/services/mock/mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/auth_user.dart';
import '../../../repositories/authentication/authentication_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitialState()) {
    on<AuthenticationEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<AuthenticationInitializeEvent>((event, emit) {
      init(event, emit);
    });
    on<AuthenticationSignOutEvent>((event, emit) {
      // TODO: implement event handler
      signOut(event, emit);
    });
    on<AuthenticationSignInEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<AuthenticationSignedInEvent>((event, emit) {
      // TODO: implement event handler
      emit(AuthenticationSignedInState(user: user!));
    });
    on<AuthenticationSignedOutEvent>((event, emit) {
      // TODO: implement event handler
      emit(AuthenticationNotSignedInState());
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
    add(AuthenticationSignedInEvent());
  }

  @override
  Future<void> close() {
    authUserStreamSubscription?.cancel();
    return super.close();
  }
}
