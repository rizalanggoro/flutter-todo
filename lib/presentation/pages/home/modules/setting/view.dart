import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/core/routes/routes.dart';
import 'package:todo/presentation/global_cubits/states/theme.dart';
import 'package:todo/presentation/global_cubits/theme.dart';

class HomeSettingView extends StatefulWidget {
  const HomeSettingView({super.key});

  @override
  State<HomeSettingView> createState() => _HomeSettingViewState();
}

class _HomeSettingViewState extends State<HomeSettingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Setting')),
      body: ListView(
        children: [
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.dark_mode_rounded),
            ),
            title: const Text('Dark mode'),
            trailing: BlocBuilder<CubitTheme, StateTheme>(
              builder: (context, state) {
                return Switch(
                  value: state.themeMode == ThemeMode.dark,
                  onChanged: (bool value) =>
                      context.read<CubitTheme>().changeTheme(
                            themeMode: value ? ThemeMode.dark : ThemeMode.light,
                          ),
                );
              },
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.category_rounded),
            ),
            title: const Text('Manage category'),
            subtitle: const Text('Create, update, delete category'),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () => context.push(Routes.category),
          ),
        ],
      ),
    );
  }
}
