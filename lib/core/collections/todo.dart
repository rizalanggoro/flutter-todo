import 'package:isar/isar.dart';
import 'package:todo/core/collections/category.dart';

part 'todo.g.dart';

@collection
class CollectionTodo {
  Id id = Isar.autoIncrement;

  String? title;
  String? detail;

  bool? isDone;

  final category = IsarLink<CollectionCategory>();
}
