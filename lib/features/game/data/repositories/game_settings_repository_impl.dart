import 'package:geometry_dash/features/game/data/datasource/game_settings_local_data_source.dart';
import 'package:geometry_dash/features/game/domain/repositories/game_settings_repository.dart';

class GameSettingsRepositoryImpl implements GameSettingsRepository {
  final GameSettingsLocalDataSource localDataSource;

  GameSettingsRepositoryImpl(this.localDataSource);

  @override
  Future<double> getPlayerStartSpeed() => localDataSource.getPlayerStartSpeed();

  @override
  Future<void> setPlayerStartSpeed(double speed) => localDataSource.setPlayerStartSpeed(speed);
}