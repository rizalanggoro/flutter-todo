import 'package:todo/core/collections/category.dart';

abstract class RepositoryCategory {
  Future<CollectionCategory> create({
    required CollectionCategory category,
  });

  Future<List<CollectionCategory>> read();

  Future<void> update({
    required CollectionCategory category,
  });

  Future<bool> delete({
    required int id,
  });
}
