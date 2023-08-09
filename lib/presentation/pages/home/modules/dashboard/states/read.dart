import 'package:todo/core/collections/todo.dart';
import 'package:todo/presentation/pages/home/modules/dashboard/states/base.dart';

sealed class HomeDashboardStateRead extends HomeDashboardState {}

class HomeDashboardStateReadLoading extends HomeDashboardStateRead {}

class HomeDashboardStateReadSuccess extends HomeDashboardStateRead {
  final List<CollectionTodo> listTodo;

  HomeDashboardStateReadSuccess({
    required this.listTodo,
  });
}

class HomeDashboardStateReadFailure extends HomeDashboardStateRead {}
