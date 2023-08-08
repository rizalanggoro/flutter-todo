import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/presentation/global_cubits/states/theme.dart';

class CubitTheme extends Cubit<StateTheme> {
  CubitTheme(super.initialState);

  void changeTheme({
    required ThemeMode themeMode,
  }) =>
      emit(StateTheme(
        themeMode: themeMode,
      ));
}
