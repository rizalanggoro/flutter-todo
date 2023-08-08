import 'package:bloc/bloc.dart';
import 'package:todo/presentation/pages/home/states/base.dart';
import 'package:todo/presentation/pages/home/states/navigation.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeStateInitial()) {
    emit(HomeStateNavigationChanged(index: 0));
  }

  void changeNavigation({
    required int index,
  }) =>
      emit(HomeStateNavigationChanged(
        index: index,
      ));
}
