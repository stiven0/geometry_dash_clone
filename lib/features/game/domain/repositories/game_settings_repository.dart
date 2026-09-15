abstract class GameSettingsRepository {
  Future<double> getPlayerStartSpeed();

  Future<void> setPlayerStartSpeed(double speed);
}