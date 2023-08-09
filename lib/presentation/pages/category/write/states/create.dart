import 'package:todo/core/collections/category.dart';
import 'package:todo/presentation/pages/category/write/states/base.dart';

sealed class CategoryWriteStateCreate extends CategoryWriteState {}

class CategoryWriteStateCreateLoading extends CategoryWriteStateCreate {}

class CategoryWriteStateCreateSuccess extends CategoryWriteStateCreate {
  final CollectionCategory category;
  CategoryWriteStateCreateSuccess({required this.category});
}

class CategoryWriteStateCreateFailure extends CategoryWriteStateCreate {
  final String errorMessage;

  CategoryWriteStateCreateFailure({
    required this.errorMessage,
  });
}
