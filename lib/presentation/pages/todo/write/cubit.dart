import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/collections/category.dart';
import 'package:todo/core/collections/todo.dart';
import 'package:todo/core/di/dependency_injection.dart';
import 'package:todo/core/models/error.dart';
import 'package:todo/domain/repositories/todo.dart';
import 'package:todo/presentation/pages/todo/write/states/base.dart';
import 'package:todo/presentation/pages/todo/write/states/create.dart';
import 'package:todo/presentation/pages/todo/write/states/selected_category.dart';

class TodoWriteCubit extends Cubit<TodoWriteState> {
  final RepositoryTodo _repositoryTodo = dependencyInjector();

  TodoWriteCubit() : super(TodoWriteStateInitial());

  void changeSelectedCategory({
    required CollectionCategory category,
  }) =>
      emit(TodoWriteStateSelectedCategoryChanged(
        category: category,
      ));

  void create({
    required CollectionTodo todo,
  }) async {
    try {
      emit(TodoWriteStateCreateLoading());
      await _repositoryTodo.create(todo: todo);
      emit(TodoWriteStateCreateSuccess());
    } catch (error) {
      var errorMessage = error.toString();
      if (error is ModelError) {
        errorMessage = error.message;
      }

      emit(TodoWriteStateCreateFailure(
        errorMessage: errorMessage,
      ));
    }
  }
}
