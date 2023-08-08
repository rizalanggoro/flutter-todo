import 'package:flutter/material.dart';
import 'package:todo/core/applications/app.dart';
import 'package:todo/core/di/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencyInjection();

  runApp(const Application());
}
