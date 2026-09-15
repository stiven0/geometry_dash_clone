import 'package:geometry_dash/core/services/storage/storage_service.dart';
import 'package:geometry_dash/features/game/data/datasource/game_settings_local_data_source.dart';

class GameSettingsLocalDataSourceImpl implements GameSettingsLocalDataSource {
  final StorageService storage;

  GameSettingsLocalDataSourceImpl(this.storage);

  @override
  Future<double> getPlayerStartSpeed() => storage.getPlayerStartSpeed();

  @override
  Future<void> setPlayerStartSpeed(double speed) => storage.setPlayerStartSpeed(speed);
}