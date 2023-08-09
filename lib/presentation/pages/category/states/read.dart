import 'package:todo/presentation/pages/category/states/base.dart';

sealed class CategoryStateRead extends CategoryState {}

class CategoryStateReadLoading extends CategoryStateRead {}

class CategoryStateReadSuccess extends CategoryStateRead {}
