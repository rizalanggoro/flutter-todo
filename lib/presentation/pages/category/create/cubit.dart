import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/collections/category.dart';
import 'package:todo/core/di/dependency_injection.dart';
import 'package:todo/core/models/error.dart';
import 'package:todo/domain/repositories/category.dart';
import 'package:todo/presentation/pages/category/create/state.dart';

class CategoryCreateCubit extends Cubit<CategoryCreateState> {
  final RepositoryCategory _repositoryCategory = dependencyInjector();

  CategoryCreateCubit() : super(CategoryCreateStateInitial());

  void create({
    required CollectionCategory category,
  }) async {
    try {
      emit(CategoryCreateStateLoading());
      await _repositoryCategory.create(category: category);
      emit(CategoryCreateStateSuccess());
    } catch (error) {
      var errorMessage = error.toString();
      if (error is ModelError) {
        errorMessage = error.message;
      }

      emit(CategoryCreateStateFailure(
        errorMessage: errorMessage,
      ));
    }
  }
}
