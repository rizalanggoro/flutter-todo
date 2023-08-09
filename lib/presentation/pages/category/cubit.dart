import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/di/dependency_injection.dart';
import 'package:todo/domain/repositories/category.dart';
import 'package:todo/presentation/pages/category/states/base.dart';
import 'package:todo/presentation/pages/category/states/read.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final RepositoryCategory _repositoryCategory = dependencyInjector();

  StreamSubscription? _subscriptionCollectionCategory;

  CategoryCubit() : super(CategoryStateInitial()) {
    _read();

    // listen to database changes
    _subscriptionCollectionCategory = _repositoryCategory.watchLazy().listen(
          (event) => _read(),
        );
  }

  @override
  Future<void> close() {
    _subscriptionCollectionCategory?.cancel();

    return super.close();
  }

  void _read() async {
    emit(CategoryStateReadLoading());

    final result = await _repositoryCategory.read();

    emit(CategoryStateReadSuccess(
      categories: result,
    ));
  }

  void delete({
    required int id,
  }) async {
    await _repositoryCategory.delete(id: id);
  }
}
