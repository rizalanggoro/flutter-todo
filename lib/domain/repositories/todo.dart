import 'package:todo/core/collections/todo.dart';

abstract class RepositoryTodo {
  Future<void> create({
    required CollectionTodo todo,
  });

  Future<List<CollectionTodo>> read();

  Stream<void> watchLazy();
}
