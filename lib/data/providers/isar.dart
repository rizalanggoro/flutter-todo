import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo/core/collections/category.dart';

class ProviderIsar {
  late Isar _isar;

  Isar get isar => _isar;

  Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [CollectionCategorySchema],
      directory: dir.path,
    );
  }
}
