import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/collections/category.dart';
import 'package:todo/core/di/dependency_injection.dart';
import 'package:todo/core/models/error.dart';
import 'package:todo/domain/repositories/category.dart';
import 'package:todo/presentation/pages/category/write/states/base.dart';
import 'package:todo/presentation/pages/category/write/states/create.dart';
import 'package:todo/presentation/pages/category/write/states/update.dart';

class CategoryWriteCubit extends Cubit<CategoryWriteState> {
  final RepositoryCategory _repositoryCategory = dependencyInjector();

  CategoryWriteCubit() : super(CategoryWriteStateInitial());

  void create({
    required CollectionCategory category,
  }) async {
    try {
      emit(CategoryWriteStateCreateLoading());
      final result = await _repositoryCategory.create(category: category);
      emit(CategoryWriteStateCreateSuccess(
        category: result,
      ));
    } catch (error) {
      var errorMessage = error.toString();
      if (error is ModelError) {
        errorMessage = error.message;
      }

      emit(CategoryWriteStateCreateFailure(
        errorMessage: errorMessage,
      ));
    }
  }

  void update({
    required CollectionCategory category,
  }) async {
    try {
      emit(CategoryWriteStateUpdateLoading());
      await _repositoryCategory.update(category: category);
      emit(CategoryWriteStateUpdateSuccess(
        category: category,
      ));
    } catch (error) {
      var errorMessage = error.toString();
      if (error is ModelError) {
        errorMessage = error.message;
      }

      emit(CategoryWriteStateUpdateFailure(
        errorMessage: errorMessage,
      ));
    }
  }
}
