import 'package:isar/isar.dart';
import 'package:todo/core/collections/todo.dart';
import 'package:todo/core/di/dependency_injection.dart';
import 'package:todo/core/models/error.dart';
import 'package:todo/data/providers/isar.dart';
import 'package:todo/domain/repositories/todo.dart';

class RepositoryTodoImpl implements RepositoryTodo {
  final ProviderIsar _providerIsar = dependencyInjector();

  @override
  Future<void> create({
    required CollectionTodo todo,
  }) async {
    final title = todo.title;
    if (title == null) {
      throw (ModelError(message: 'Todo name can\'t be null!'));
    }

    if (title.trim().isEmpty) {
      throw (ModelError(message: 'Todo name can\'t be empty!'));
    }

    if (todo.category.value == null) {
      throw (ModelError(message: 'Todo\'s category must be selected!'));
    }

    final isar = _providerIsar.isar;
    await isar.writeTxn(() async {
      await isar.collectionTodos.put(todo);
      await todo.category.save();
    });
  }

  @override
  Future<List<CollectionTodo>> read() async {
    final isar = _providerIsar.isar;
    return isar.collectionTodos.where().findAll();
  }

  @override
  Stream<void> watchLazy() {
    final isar = _providerIsar.isar;
    return isar.collectionTodos.watchLazy();
  }
}
