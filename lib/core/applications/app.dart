import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/routes/config.dart';
import 'package:todo/presentation/global_cubits/states/theme.dart';
import 'package:todo/presentation/global_cubits/theme.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitTheme(
        StateTheme(themeMode: ThemeMode.light),
      ),
      child: BlocBuilder<CubitTheme, StateTheme>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: RoutesConfig.value,
            themeMode: state.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              colorSchemeSeed: Colors.teal,
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              colorSchemeSeed: Colors.teal,
              useMaterial3: true,
            ),
          );
        },
      ),
    );
  }
}
