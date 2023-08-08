import 'package:isar/isar.dart';

part 'category.g.dart';

@collection
class CollectionCategory {
  Id id = Isar.autoIncrement;

  String? name;
}
