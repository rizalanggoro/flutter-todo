import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/core/routes/routes.dart';
import 'package:todo/presentation/pages/category/cubit.dart';
import 'package:todo/presentation/pages/category/states/base.dart';
import 'package:todo/presentation/pages/category/states/read.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Category')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(Routes.categoryCreate),
        child: const Icon(Icons.add_rounded),
      ),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        buildWhen: (previous, current) => current is CategoryStateRead,
        builder: (context, state) {
          if (state is CategoryStateReadLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CategoryStateReadSuccess) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    state.categories[index].name ?? 'No category name',
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => {},
                        icon: const Icon(Icons.edit_rounded),
                      ),
                      IconButton(
                        onPressed: () => {},
                        icon: const Icon(Icons.delete_rounded),
                      ),
                    ],
                  ),
                );
              },
              itemCount: state.categories.length,
            );
          }

          return Container();
        },
      ),
    );
  }
}
