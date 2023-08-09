import 'package:todo/presentation/pages/category/write/states/base.dart';

sealed class CategoryWriteStateCreate extends CategoryWriteState {}

class CategoryWriteStateCreateLoading extends CategoryWriteStateCreate {}

class CategoryWriteStateCreateSuccess extends CategoryWriteStateCreate {}

class CategoryWriteStateCreateFailure extends CategoryWriteStateCreate {
  final String errorMessage;

  CategoryWriteStateCreateFailure({
    required this.errorMessage,
  });
}
