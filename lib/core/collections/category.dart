import 'package:isar/isar.dart';
import 'package:todo/core/collections/todo.dart';

part 'category.g.dart';

@collection
class CollectionCategory {
  Id id = Isar.autoIncrement;

  String? name;

  @Backlink(to: 'category')
  final listTodo = IsarLinks<CollectionTodo>();
}
