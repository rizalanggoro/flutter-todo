import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/core/collections/category.dart';
import 'package:todo/presentation/pages/category/create/cubit.dart';
import 'package:todo/presentation/pages/category/create/state.dart';

class CategoryCreateView extends StatefulWidget {
  const CategoryCreateView({super.key});

  @override
  State<CategoryCreateView> createState() => _CategoryCreateViewState();
}

class _CategoryCreateViewState extends State<CategoryCreateView> {
  final TextEditingController _controllerName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create category')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
            ),
            child: TextField(
              controller: _controllerName,
              decoration: const InputDecoration(
                hintText: 'Category name',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          // bloc listener
          BlocListener<CategoryCreateCubit, CategoryCreateState>(
            listener: (context, state) {
              if (state is CategoryCreateStateSuccess) {
                context.pop();
              }

              if (state is CategoryCreateStateFailure) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.errorMessage),
                ));
              }
            },
            child: Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.all(16),
              child: FilledButton(
                onPressed: () => _onTapButtonCreate(),
                child: const Text('Create'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onTapButtonCreate() {
    final category = CollectionCategory();
    category.name = _controllerName.text;

    context.read<CategoryCreateCubit>().create(
          category: category,
        );
  }
}
