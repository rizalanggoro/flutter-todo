import 'package:get_it/get_it.dart';
import 'package:todo/data/providers/isar.dart';
import 'package:todo/data/repositories/category_impl.dart';
import 'package:todo/data/repositories/todo_impl.dart';
import 'package:todo/domain/repositories/category.dart';
import 'package:todo/domain/repositories/todo.dart';

final GetIt dependencyInjector = GetIt.instance;

Future<void> initializeDependencyInjection() async {
  // providers
  dependencyInjector.registerLazySingleton(() => ProviderIsar());

  await dependencyInjector<ProviderIsar>().initialize();

  // repositories
  dependencyInjector.registerLazySingleton<RepositoryCategory>(
    () => RepositoryCategoryImpl(),
  );
  dependencyInjector.registerLazySingleton<RepositoryTodo>(
    () => RepositoryTodoImpl(),
  );
}
