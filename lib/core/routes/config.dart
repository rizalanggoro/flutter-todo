import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/core/routes/routes.dart';
import 'package:todo/presentation/pages/category/create/cubit.dart';
import 'package:todo/presentation/pages/category/create/view.dart';
import 'package:todo/presentation/pages/category/view.dart';
import 'package:todo/presentation/pages/home/cubit.dart';
import 'package:todo/presentation/pages/home/view.dart';
import 'package:todo/presentation/pages/todo/create/view.dart';
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
      builder: (context, state) => const TodoCreateView(),
    ),

    // category
    GoRoute(
      path: Routes.category,
      builder: (context, state) => const CategoryView(),
    ),
    GoRoute(
      path: Routes.categoryCreate,
      builder: (context, state) => BlocProvider(
        create: (context) => CategoryCreateCubit(),
        child: const CategoryCreateView(),
      ),
    ),
  ];
}
