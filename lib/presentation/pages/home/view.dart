import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/presentation/pages/home/cubit.dart';
import 'package:todo/presentation/pages/home/modules/dashboard/view.dart';
import 'package:todo/presentation/pages/home/modules/setting/view.dart';
import 'package:todo/presentation/pages/home/states/base.dart';
import 'package:todo/presentation/pages/home/states/navigation.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _modules = const [
    HomeDashboardView(),
    HomeSettingView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) => current is HomeStateNavigation,
        builder: (context, state) {
          var selectedIndex = 0;
          if (state is HomeStateNavigationChanged) {
            selectedIndex = state.index;
          }

          return NavigationBar(
            selectedIndex: selectedIndex,
            onDestinationSelected: (value) =>
                context.read<HomeCubit>().changeNavigation(
                      index: value,
                    ),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.dashboard_outlined),
                selectedIcon: Icon(Icons.dashboard_rounded),
                label: 'Dashboard',
              ),
              NavigationDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings_rounded),
                label: 'Setting',
              ),
            ],
          );
        },
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) => current is HomeStateNavigationChanged,
        builder: (context, state) {
          var navigationIndex = 0;
          if (state is HomeStateNavigationChanged) {
            navigationIndex = state.index;
          }

          return _modules[navigationIndex];
        },
      ),
    );
  }
}
