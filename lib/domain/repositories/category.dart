import 'package:todo/core/collections/category.dart';

abstract class RepositoryCategory {
  Future<void> create({
    required CollectionCategory category,
  });
}