import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/core/routes/routes.dart';

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
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Category $index'),
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
        itemCount: 10,
      ),
    );
  }
}
