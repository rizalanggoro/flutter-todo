import 'package:todo/presentation/pages/todo/write/states/base.dart';

sealed class TodoWriteStateCreate extends TodoWriteState {}

class TodoWriteStateCreateLoading extends TodoWriteStateCreate {}

class TodoWriteStateCreateSuccess extends TodoWriteStateCreate {}

class TodoWriteStateCreateFailure extends TodoWriteStateCreate {
  final String errorMessage;

  TodoWriteStateCreateFailure({
    required this.errorMessage,
  });
}
