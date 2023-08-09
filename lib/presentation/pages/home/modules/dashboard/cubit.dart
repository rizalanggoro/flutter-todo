import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/di/dependency_injection.dart';
import 'package:todo/domain/repositories/todo.dart';
import 'package:todo/presentation/pages/home/modules/dashboard/states/base.dart';
import 'package:todo/presentation/pages/home/modules/dashboard/states/read.dart';

class HomeDashboardCubit extends Cubit<HomeDashboardState> {
  final RepositoryTodo _repositoryTodo = dependencyInjector();

  HomeDashboardCubit() : super(HomeDashboardStateInitial()) {
    _read();
  }

  void _read() async {
    emit(HomeDashboardStateReadLoading());
    final result = await _repositoryTodo.read();
    emit(HomeDashboardStateReadSuccess(
      listTodo: result,
    ));
  }
}
