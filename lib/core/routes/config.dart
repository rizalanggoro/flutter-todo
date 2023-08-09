import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/core/collections/category.dart';
import 'package:todo/core/routes/routes.dart';
import 'package:todo/presentation/pages/category/select/view.dart';
import 'package:todo/presentation/pages/category/write/cubit.dart';
import 'package:todo/presentation/pages/category/write/view.dart';
import 'package:todo/presentation/pages/category/cubit.dart';
import 'package:todo/presentation/pages/category/view.dart';
import 'package:todo/presentation/pages/home/cubit.dart';
import 'package:todo/presentation/pages/home/view.dart';
import 'package:todo/presentation/pages/todo/write/cubit.dart';
import 'package:todo/presentation/pages/todo/write/view.dart';
import 'package:todo/presentation/pages/todo/view.dart';

abstract class RoutesConfig {
  static final value = GoRouter(routes: pages);
  static final pages = <GoRoute>[
    GoRoute(
      path: Routes.home,
      builder: (context, state) => BlocProvider(
        create: (context) => HomeCubit(),
        child: const HomeView(),
      ),
    ),

    // todo
    GoRoute(
      path: Routes.todo,
      builder: (context, state) => const TodoView(),
    ),
    GoRoute(
      path: Routes.todoCreate,
      builder: (context, state) {
        return BlocProvider(
          create: (context) => TodoWriteCubit(),
          child: const TodoWriteView(),
        );
      },
    ),

    // category
    GoRoute(
      path: Routes.category,
      builder: (context, state) => BlocProvider(
        create: (context) => CategoryCubit(),
        child: const CategoryView(),
      ),
    ),
    GoRoute(
      path: Routes.categoryWrite,
      builder: (context, state) {
        CollectionCategory? category;

        final extra = state.extra;
        if (extra != null && extra is CollectionCategory) {
          category = extra;
        }

        return BlocProvider(
          create: (context) => CategoryWriteCubit(),
          child: CategoryWriteView(
            category: category,
          ),
        );
      },
    ),
    GoRoute(
      path: Routes.categorySelect,
      builder: (context, state) {
        CollectionCategory? initialCategory;

        final extra = state.extra;
        if (extra != null && extra is CollectionCategory) {
          initialCategory = extra;
        }

        return CategorySelectView(
          initialCategory: initialCategory,
        );
      },
    ),
  ];
}
