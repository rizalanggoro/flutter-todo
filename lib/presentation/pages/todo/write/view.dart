import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/core/collections/category.dart';
import 'package:todo/core/collections/todo.dart';
import 'package:todo/core/routes/routes.dart';
import 'package:todo/presentation/pages/todo/write/cubit.dart';
import 'package:todo/presentation/pages/todo/write/states/base.dart';
import 'package:todo/presentation/pages/todo/write/states/create.dart';
import 'package:todo/presentation/pages/todo/write/states/selected_category.dart';

class TodoWriteView extends StatefulWidget {
  const TodoWriteView({super.key});

  @override
  State<TodoWriteView> createState() => _TodoWriteViewState();
}

class _TodoWriteViewState extends State<TodoWriteView> {
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerDetail = TextEditingController();

  CollectionCategory? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create todo')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.category_rounded),
              ),
              title: const Text('Category'),
              subtitle: BlocConsumer<TodoWriteCubit, TodoWriteState>(
                listener: (context, state) {
                  if (state is TodoWriteStateSelectedCategoryChanged) {
                    _selectedCategory = state.category;
                  }
                },
                listenWhen: (previous, current) =>
                    current is TodoWriteStateSelectedCategoryChanged,
                buildWhen: (previous, current) =>
                    current is TodoWriteStateSelectedCategoryChanged,
                builder: (context, state) {
                  var text = 'No category selected';
                  if (state is TodoWriteStateSelectedCategoryChanged) {
                    text = state.category.name ?? 'No category name';
                  }

                  return Text(text);
                },
              ),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () async {
                final result = await context.push(
                  Routes.categorySelect,
                  extra: _selectedCategory,
                );

                if (context.mounted &&
                    result != null &&
                    result is CollectionCategory) {
                  context.read<TodoWriteCubit>().changeSelectedCategory(
                        category: result,
                      );
                }
              },
            ),

            // title
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
              ),
              child: TextField(
                controller: _controllerTitle,
                decoration: const InputDecoration(
                  hintText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            // description
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 8,
              ),
              child: TextField(
                controller: _controllerDetail,
                maxLines: null,
                minLines: 5,
                decoration: const InputDecoration(
                  hintText: 'Detail',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(16),
              child: BlocListener<TodoWriteCubit, TodoWriteState>(
                listener: (context, state) {
                  if (state is TodoWriteStateCreateSuccess) {
                    context.pop();
                  }

                  if (state is TodoWriteStateCreateFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errorMessage)),
                    );
                  }
                },
                child: FilledButton(
                  onPressed: () => _onTapButtonCreate(),
                  child: const Text('Create'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapButtonCreate() {
    final todo = CollectionTodo();
    todo.title = _controllerTitle.text;
    todo.detail = _controllerDetail.text;
    todo.category.value = _selectedCategory;

    context.read<TodoWriteCubit>().create(
          todo: todo,
        );
  }
}
