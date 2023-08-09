import 'package:todo/core/collections/category.dart';

abstract class RepositoryCategory {
  Future<void> create({
    required CollectionCategory category,
  });

  Future<List<CollectionCategory>> read();

  Future<void> delete({
    required int id,
  });

  Stream<void> watchLazy();
}
