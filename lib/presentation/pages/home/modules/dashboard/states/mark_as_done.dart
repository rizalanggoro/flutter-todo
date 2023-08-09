import 'package:todo/core/collections/todo.dart';
import 'package:todo/presentation/pages/home/modules/dashboard/states/base.dart';

sealed class HomeDashboardStateMarkAsDone extends HomeDashboardState {}

class HomeDashboardStateMarkAsDoneLoading
    extends HomeDashboardStateMarkAsDone {}

class HomeDashboardStateMarkAsDoneSuccess extends HomeDashboardStateMarkAsDone {
  final CollectionTodo todo;

  HomeDashboardStateMarkAsDoneSuccess({
    required this.todo,
  });
}
