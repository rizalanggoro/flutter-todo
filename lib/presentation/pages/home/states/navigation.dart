import 'package:todo/presentation/pages/home/states/base.dart';

sealed class HomeStateNavigation extends HomeState {}

class HomeStateNavigationChanged extends HomeStateNavigation {
  final int index;

  HomeStateNavigationChanged({
    required this.index,
  });
}
