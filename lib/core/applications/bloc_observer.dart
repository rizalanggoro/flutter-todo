import 'dart:developer';

import 'package:bloc/bloc.dart';

class ApplicationBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    log('[${bloc.runtimeType}] ${change.currentState.runtimeType} -> ${change.nextState.runtimeType}');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);

    log('[${bloc.runtimeType}] closed!');
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);

    log('[${bloc.runtimeType}] created!');
  }
}
