abstract class GameSettingsLocalDataSource {
  Future<double> getPlayerStartSpeed();

  Future<void> setPlayerStartSpeed(double speed);
}