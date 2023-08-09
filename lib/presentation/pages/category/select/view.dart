import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/core/collections/category.dart';
import 'package:todo/core/di/dependency_injection.dart';
import 'package:todo/domain/repositories/category.dart';

class CategorySelectView extends StatefulWidget {
  final CollectionCategory? initialCategory;

  const CategorySelectView({
    super.key,
    this.initialCategory,
  });

  @override
  State<CategorySelectView> createState() => _CategorySelectViewState();
}

class _CategorySelectViewState extends State<CategorySelectView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select category')),
      body: FutureBuilder(
        future: dependencyInjector<RepositoryCategory>().read(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var categories = <CollectionCategory>[];
            final data = snapshot.data;
            if (data != null) {
              categories = data;
            }

            if (categories.isNotEmpty) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final category = categories[index];

                  return RadioListTile<int>(
                    value: category.id,
                    groupValue: widget.initialCategory?.id ?? -1,
                    onChanged: (value) => context.pop(category),
                    title: Text(
                      category.name ?? 'No category name',
                    ),
                  );
                },
                itemCount: categories.length,
              );
            } else {
              return const Center(
                child: Text('No data'),
              );
            }
          } else {
            return const Center(
              child: Text('Loading'),
            );
          }
        },
      ),
    );
  }
}
