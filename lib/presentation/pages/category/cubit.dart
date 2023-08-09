import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/collections/category.dart';
import 'package:todo/core/di/dependency_injection.dart';
import 'package:todo/domain/repositories/category.dart';
import 'package:todo/presentation/pages/category/states/base.dart';
import 'package:todo/presentation/pages/category/states/on_created.dart';
import 'package:todo/presentation/pages/category/states/on_deleted.dart';
import 'package:todo/presentation/pages/category/states/on_updated.dart';
import 'package:todo/presentation/pages/category/states/read.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final RepositoryCategory _repositoryCategory = dependencyInjector();

  List<CollectionCategory> _listCategory = [];
  List<CollectionCategory> get listCategory => _listCategory;

  CategoryCubit() : super(CategoryStateInitial()) {
    _read();
  }

  void _read() async {
    emit(CategoryStateReadLoading());
    _listCategory = await _repositoryCategory.read();
    emit(CategoryStateReadSuccess());
  }

  void onCreated({
    required CollectionCategory category,
  }) async {
    _listCategory.add(category);
    _listCategory.sort((a, b) => (a.name ?? '').compareTo((b.name ?? '')));
    emit(CategoryStateOnCreated());
  }

  void onUpdated({
    required CollectionCategory category,
  }) {
    final index = _listCategory.indexWhere(
      (element) => element.id == category.id,
    );
    if (index != -1) {
      _listCategory.removeAt(index);
      _listCategory.insert(index, category);
      emit(CategoryStateOnUpdated());
    }
  }

  void delete({
    required int id,
  }) async {
    final result = await _repositoryCategory.delete(id: id);
    if (result) {
      _listCategory.removeWhere((element) => element.id == id);
      emit(CategoryStateOnDeleted());
    }
  }
}
