abstract class GameLocalDataSource {
  Future<int> getDiamonds();
  Future<void> addDiamonds(int amount);

  Future<void> setFastestLevelTime(double time);
  Future<void> setFastestLevelCompleted(int level);

  Future<int> getFastestLevelTime();
  Future<int> getFastestLevelCompleted();
}
