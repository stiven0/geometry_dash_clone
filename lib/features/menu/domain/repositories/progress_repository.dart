abstract class ProgressRepository {
  Future<int> getUnlockedLevel();
  Future<void> unlockLevel(int level);
}
