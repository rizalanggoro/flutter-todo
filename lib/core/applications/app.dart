import 'package:flutter/material.dart';
import 'package:todo/core/routes/config.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RoutesConfig.value,
    );
  }
}
