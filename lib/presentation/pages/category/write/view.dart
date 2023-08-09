import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/core/collections/category.dart';
import 'package:todo/presentation/pages/category/write/cubit.dart';
import 'package:todo/presentation/pages/category/write/states/base.dart';
import 'package:todo/presentation/pages/category/write/states/create.dart';
import 'package:todo/presentation/pages/category/write/states/update.dart';

extension _CategoryWriteX on CollectionCategory? {
  bool get isNotNull => this != null;
}

class CategoryWriteView extends StatefulWidget {
  final CollectionCategory? category;

  const CategoryWriteView({
    super.key,
    this.category,
  });

  @override
  State<CategoryWriteView> createState() => _CategoryWriteViewState();
}

class _CategoryWriteViewState extends State<CategoryWriteView> {
  final TextEditingController _controllerName = TextEditingController();

  @override
  void initState() {
    super.initState();

    _controllerName.text = widget.category?.name ?? '';
  }

  @override
  void dispose() {
    super.dispose();

    _controllerName.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category.isNotNull ? 'Update category' : 'Create category',
        ),
      ),
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
          BlocListener<CategoryWriteCubit, CategoryWriteState>(
            listener: (context, state) {
              if (state is CategoryWriteStateCreateSuccess) {
                context.pop(state.category);
              }
              if (state is CategoryWriteStateUpdateSuccess) {
                context.pop(state.category);
              }

              if (state is CategoryWriteStateCreateFailure) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.errorMessage),
                ));
              }

              if (state is CategoryWriteStateUpdateFailure) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.errorMessage),
                ));
              }
            },
            child: Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.all(16),
              child: FilledButton(
                onPressed: () => widget.category.isNotNull
                    ? _onTapButtonUpdate()
                    : _onTapButtonCreate(),
                child: Text(
                  widget.category.isNotNull ? 'Update' : 'Create',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onTapButtonUpdate() {
    final category = CollectionCategory();
    category.id = widget.category!.id;
    category.name = _controllerName.text;

    context.read<CategoryWriteCubit>().update(
          category: category,
        );
  }

  void _onTapButtonCreate() {
    final category = CollectionCategory();
    category.name = _controllerName.text;

    context.read<CategoryWriteCubit>().create(
          category: category,
        );
  }
}
