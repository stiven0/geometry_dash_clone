abstract class ProgressLocalDataSource {
  Future<int> getUnlockedLevel();
  Future<void> unlockLevel(int level);
}
