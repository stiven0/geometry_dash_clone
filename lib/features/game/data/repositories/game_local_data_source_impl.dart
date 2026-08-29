import 'package:geometry_dash/core/services/storage/storage_service.dart';
import 'package:geometry_dash/features/game/data/datasource/game_local_data_source.dart';

class GameLocalDataSourceImpl implements GameLocalDataSource {
  final StorageService storage;

  GameLocalDataSourceImpl(this.storage);

  @override
  Future<int> getDiamonds() => storage.getDiamonds();

  @override
  Future<void> addDiamonds(int amount) => storage.addDiamonds(amount);

  @override
  Future<void> setFastestLevelTime(double time) => storage.setFastestLevelTime(time);

  @override
  Future<void> setFastestLevelCompleted(int level) => storage.setFastestLevelCompleted(level);

  @override
  Future<double> getFastestLevelTime() => storage.getFastestLevelTime();

  @override
  Future<int> getFastestLevelCompleted() => storage.getFastestLevelCompleted();
}
