import 'package:todo/core/collections/category.dart';
import 'package:todo/presentation/pages/todo/write/states/base.dart';

class TodoWriteStateSelectedCategoryChanged extends TodoWriteState {
  final CollectionCategory category;

  TodoWriteStateSelectedCategoryChanged({
    required this.category,
  });
}
