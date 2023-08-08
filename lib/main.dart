import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/applications/app.dart';
import 'package:todo/core/applications/bloc_observer.dart';
import 'package:todo/core/di/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = ApplicationBlocObserver();

  await initializeDependencyInjection();

  runApp(const Application());
}
