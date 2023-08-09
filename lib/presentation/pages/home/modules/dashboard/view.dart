import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/core/collections/todo.dart';
import 'package:todo/core/routes/routes.dart';
import 'package:todo/presentation/pages/home/modules/dashboard/cubit.dart';
import 'package:todo/presentation/pages/home/modules/dashboard/states/base.dart';
import 'package:todo/presentation/pages/home/modules/dashboard/states/read.dart';

class HomeDashboardView extends StatefulWidget {
  const HomeDashboardView({super.key});

  @override
  State<HomeDashboardView> createState() => _HomeDashboardViewState();
}

class _HomeDashboardViewState extends State<HomeDashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(Routes.todoCreate),
        child: const Icon(Icons.add_rounded),
      ),
      body: BlocBuilder<HomeDashboardCubit, HomeDashboardState>(
        builder: (context, state) {
          var status = 'Loading';
          if (state is HomeDashboardStateReadSuccess) {
            final listTodo = state.listTodo;
            if (listTodo.isEmpty) {
              status = 'No data';
            } else {
              return _listTodo(listTodo: listTodo);
            }
          }

          return Center(
            child: Text(
              status,
            ),
          );
        },
      ),
    );
  }

  Widget _listTodo({
    required List<CollectionTodo> listTodo,
  }) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final todo = listTodo[index];

        return ListTile(
          title: Text(todo.title ?? 'No title'),
          subtitle: Text(
            todo.category.value?.name ?? 'No category',
          ),
          trailing: const Icon(Icons.chevron_right_rounded),
          onTap: () => {},
        );
      },
      itemCount: listTodo.length,
    );
  }
}
