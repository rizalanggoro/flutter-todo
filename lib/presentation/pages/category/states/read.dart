import 'package:todo/core/collections/category.dart';
import 'package:todo/presentation/pages/category/states/base.dart';

sealed class CategoryStateRead extends CategoryState {}

class CategoryStateReadLoading extends CategoryStateRead {}

class CategoryStateReadSuccess extends CategoryStateRead {
  final List<CollectionCategory> categories;

  CategoryStateReadSuccess({
    required this.categories,
  });
}
