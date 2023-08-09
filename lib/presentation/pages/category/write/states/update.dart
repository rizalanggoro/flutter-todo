import 'package:todo/presentation/pages/category/write/states/base.dart';

sealed class CategoryWriteStateUpdate extends CategoryWriteState {}

class CategoryWriteStateUpdateLoading extends CategoryWriteStateUpdate {}

class CategoryWriteStateUpdateSuccess extends CategoryWriteStateUpdate {}

class CategoryWriteStateUpdateFailure extends CategoryWriteStateUpdate {
  final String errorMessage;

  CategoryWriteStateUpdateFailure({
    required this.errorMessage,
  });
}
