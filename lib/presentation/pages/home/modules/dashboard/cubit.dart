import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/collections/todo.dart';
import 'package:todo/core/di/dependency_injection.dart';
import 'package:todo/domain/repositories/todo.dart';
import 'package:todo/presentation/pages/home/modules/dashboard/states/base.dart';
import 'package:todo/presentation/pages/home/modules/dashboard/states/mark_as_done.dart';
import 'package:todo/presentation/pages/home/modules/dashboard/states/read.dart';

class HomeDashboardCubit extends Cubit<HomeDashboardState> {
  final RepositoryTodo _repositoryTodo = dependencyInjector();

  StreamSubscription? _subscriptionCollectionTodo;
  List<CollectionTodo> _listTodo = [];

  HomeDashboardCubit() : super(HomeDashboardStateInitial()) {
    _read();

    // _subscriptionCollectionTodo =
    //     _repositoryTodo.watchLazy().listen((event) => _read());
  }

  @override
  Future<void> close() {
    _subscriptionCollectionTodo?.cancel();

    return super.close();
  }

  void _read() async {
    try {
      emit(HomeDashboardStateReadLoading());
      _listTodo = await _repositoryTodo.read();
      emit(HomeDashboardStateReadSuccess(
        listTodo: _listTodo,
      ));
    } catch (error) {
      emit(HomeDashboardStateReadFailure());
    }
  }

  void create({
    required CollectionTodo todo,
  }) {}

  void markAsDone({
    required CollectionTodo todo,
  }) async {
    emit(HomeDashboardStateMarkAsDoneLoading());

    todo.isDone = true;
    await _repositoryTodo.markAsDone(todo: todo);

    emit(HomeDashboardStateMarkAsDoneSuccess(
      todo: todo,
    ));
  }

  // void unmarkAsDone({
  //   required CollectionTodo todo,
  // }) async {
  //   emit(HomeDashboardStateMarkAsDoneLoading());

  //   todo.isDone = false;
  //   await _repositoryTodo.markAsDone(todo: todo);

  //   emit(HomeDashboardStateMarkAsDoneSuccess(
  //     todo: todo,
  //   ));
  // }
}
