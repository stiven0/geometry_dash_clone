import 'package:geometry_dash/features/menu/data/datasource/progress_local_data_source.dart';
import 'package:geometry_dash/features/menu/domain/repositories/progress_repository.dart';

class ProgressRepositoryImpl implements ProgressRepository {
  final ProgressLocalDataSource localDataSource;

  ProgressRepositoryImpl(this.localDataSource);

  @override
  Future<int> getUnlockedLevel() => localDataSource.getUnlockedLevel();

  @override
  Future<void> unlockLevel(int level) => localDataSource.unlockLevel(level);
}
