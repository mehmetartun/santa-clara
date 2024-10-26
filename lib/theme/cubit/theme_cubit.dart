import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeMode: ThemeMode.system));
  ThemeMode themeMode = ThemeMode.system;

  void changeThemeMode(ThemeMode mode) {
    themeMode = mode;
    emit(ThemeState(themeMode: themeMode));
  }
}
