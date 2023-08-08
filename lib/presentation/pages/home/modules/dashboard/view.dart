import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/core/routes/routes.dart';

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
    );
  }
}
