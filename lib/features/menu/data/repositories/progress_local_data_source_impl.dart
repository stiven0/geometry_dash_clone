import 'package:geometry_dash/core/services/storage/storage_service.dart';
import 'package:geometry_dash/features/menu/data/datasource/progress_local_data_source.dart';

class ProgressLocalDataSourceImpl implements ProgressLocalDataSource {
  final StorageService storage;

  ProgressLocalDataSourceImpl(this.storage);

  @override
  Future<int> getUnlockedLevel() => storage.getUnlockedLevel();

  @override
  Future<void> unlockLevel(int level) => storage.unlockLevel(level);
}
