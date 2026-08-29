import 'package:geometry_dash/features/game/data/datasource/game_local_data_source.dart';
import 'package:geometry_dash/features/game/domain/repositories/game_repository.dart';

class GameRepositoryImpl implements GameRepository {
  final GameLocalDataSource localDataSource;

  GameRepositoryImpl(this.localDataSource);

  @override
  Future<int> getDiamonds() => localDataSource.getDiamonds();

  @override
  Future<void> addDiamonds(int amount) => localDataSource.addDiamonds(amount);

  @override
  Future<void> setFastestLevelTime(double time) => localDataSource.setFastestLevelTime(time);

  @override
  Future<void> setFastestLevelCompleted(int level) => localDataSource.setFastestLevelCompleted(level);

  @override
  Future<double> getFastestLevelTime() => localDataSource.getFastestLevelTime();

  @override
  Future<int> getFastestLevelCompleted() => localDataSource.getFastestLevelCompleted();
}
