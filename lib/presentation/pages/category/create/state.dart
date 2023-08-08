sealed class CategoryCreateState {}

class CategoryCreateStateInitial extends CategoryCreateState {}

class CategoryCreateStateLoading extends CategoryCreateState {}

class CategoryCreateStateSuccess extends CategoryCreateState {}

class CategoryCreateStateFailure extends CategoryCreateState {
  final String errorMessage;

  CategoryCreateStateFailure({
    required this.errorMessage,
  });
}
