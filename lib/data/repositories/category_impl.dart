import 'package:isar/isar.dart';
import 'package:todo/core/collections/category.dart';
import 'package:todo/core/di/dependency_injection.dart';
import 'package:todo/core/models/error.dart';
import 'package:todo/data/providers/isar.dart';
import 'package:todo/domain/repositories/category.dart';

class RepositoryCategoryImpl implements RepositoryCategory {
  final ProviderIsar _providerIsar = dependencyInjector();

  Future<bool> _isAvailableToCreate({
    required String name,
  }) async {
    final isar = _providerIsar.isar;
    return await isar.collectionCategorys
        .filter()
        .nameEqualTo(
          name,
          caseSensitive: false,
        )
        .isEmpty();
  }

  @override
  Future<void> create({
    required CollectionCategory category,
  }) async {
    final isar = _providerIsar.isar;

    final categoryName = category.name;
    if (categoryName == null) {
      throw (ModelError(message: 'Category name can\'t be null!'));
    }

    if (categoryName.trim().isEmpty) {
      throw (ModelError(message: 'Category name can\'t be blank!'));
    }

    if (!await _isAvailableToCreate(name: categoryName)) {
      throw (ModelError(message: 'Category with this name already added!'));
    }

    await isar.writeTxn(() async {
      await isar.collectionCategorys.put(category);
    });
  }

  @override
  Future<List<CollectionCategory>> read() async {
    final isar = _providerIsar.isar;
    return isar.collectionCategorys.where().sortByName().findAll();
  }

  @override
  Future<void> update({
    required CollectionCategory category,
  }) async {
    final categoryName = category.name;
    if (categoryName == null) {
      throw (ModelError(message: 'Category name can\'t be null!'));
    }

    if (categoryName.trim().isEmpty) {
      throw (ModelError(message: 'Category name can\'t be blank!'));
    }

    if (!await _isAvailableToCreate(name: categoryName)) {
      throw (ModelError(message: 'Category with this name already added!'));
    }

    final isar = _providerIsar.isar;
    await isar.writeTxn(() async {
      await isar.collectionCategorys.put(category);
    });
  }

  @override
  Future<void> delete({
    required int id,
  }) async {
    final isar = _providerIsar.isar;

    await isar.writeTxn(() async {
      await isar.collectionCategorys.delete(id);
    });
  }

  @override
  Stream<void> watchLazy() {
    return _providerIsar.isar.collectionCategorys.watchLazy();
  }
}
