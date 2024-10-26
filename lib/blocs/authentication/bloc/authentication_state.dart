part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitialState extends AuthenticationState {}

final class AuthenticationNotSignedInState extends AuthenticationState {}

final class AuthenticationSignedInState extends AuthenticationState {
  final User user;

  AuthenticationSignedInState({required this.user});
}
