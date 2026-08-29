abstract class GameRepository {
  Future<int> getDiamonds();
  Future<void> addDiamonds(int amount);

  Future<void> setFastestLevelTime(double time);
  Future<void> setFastestLevelCompleted(int level);

  Future<double> getFastestLevelTime();
  Future<int> getFastestLevelCompleted();
}
