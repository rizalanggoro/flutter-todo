import 'dart:developer';

import 'package:bloc/bloc.dart';

class ApplicationBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    log('[${bloc.runtimeType}] ${change.currentState.runtimeType} -> ${change.nextState.runtimeType}');
  }
}
