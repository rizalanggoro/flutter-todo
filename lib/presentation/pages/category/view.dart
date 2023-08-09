import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/core/collections/category.dart';
import 'package:todo/core/routes/routes.dart';
import 'package:todo/presentation/pages/category/cubit.dart';
import 'package:todo/presentation/pages/category/states/base.dart';
import 'package:todo/presentation/pages/category/states/on_created.dart';
import 'package:todo/presentation/pages/category/states/on_deleted.dart';
import 'package:todo/presentation/pages/category/states/on_updated.dart';
import 'package:todo/presentation/pages/category/states/read.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  late CategoryCubit _cubit;

  @override
  void initState() {
    super.initState();

    _cubit = context.read<CategoryCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Category')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await context.push(Routes.categoryWrite);
          if (result != null && result is CollectionCategory) {
            _cubit.onCreated(category: result);
          }
        },
        child: const Icon(Icons.add_rounded),
      ),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        buildWhen: (previous, current) =>
            current is CategoryStateRead ||
            current is CategoryStateOnCreated ||
            current is CategoryStateOnUpdated ||
            current is CategoryStateOnDeleted,
        builder: (context, state) {
          if (state is CategoryStateReadLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (_cubit.listCategory.isEmpty) {
            return const Center(
              child: Text('No data'),
            );
          }

          return ListView.builder(
            itemBuilder: (context, index) {
              final category = _cubit.listCategory[index];

              return ListTile(
                title: Text(
                  category.name ?? 'No category name',
                ),
                subtitle: Text('ID: ${category.id}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () async {
                        final result = await context.push(
                          Routes.categoryWrite,
                          extra: category,
                        );

                        if (result != null &&
                            result is CollectionCategory &&
                            context.mounted) {
                          context.read<CategoryCubit>().onUpdated(
                                category: result,
                              );
                        }
                      },
                      icon: const Icon(Icons.edit_rounded),
                    ),
                    IconButton(
                      onPressed: () => context.read<CategoryCubit>().delete(
                            id: category.id,
                          ),
                      icon: const Icon(Icons.delete_rounded),
                    ),
                  ],
                ),
              );
            },
            itemCount: _cubit.listCategory.length,
          );
        },
      ),
    );
  }
}
