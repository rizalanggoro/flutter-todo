import 'package:todo/core/collections/todo.dart';

abstract class RepositoryTodo {
  Future<void> create({
    required CollectionTodo todo,
  });

  Future<List<CollectionTodo>> read();

  Future<void> markAsDone({
    required CollectionTodo todo,
  });

  Stream<void> watchLazy();
}
