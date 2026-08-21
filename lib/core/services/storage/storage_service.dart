import 'package:shared_preferences/shared_preferences.dart';

class StorageService {

  static const String _unlockedLevelKey = 'unlocked_level';
  static const String _diamondsKey = 'diamonds';

  Future<int> getUnlockedLevel() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_unlockedLevelKey) ?? 1;
  }

  Future<void> unlockLevel(int level) async {
    final prefs = await SharedPreferences.getInstance();
    final current = prefs.getInt(_unlockedLevelKey) ?? 1;

    if (level > current) {
      await prefs.setInt(_unlockedLevelKey, level);
    }
  }

  Future<int> getDiamonds() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_diamondsKey) ?? 0;
  }

  Future<void> addDiamonds(int amount) async {
    final prefs = await SharedPreferences.getInstance();
    final currentDiamonds = prefs.getInt(_diamondsKey) ?? 0;
    await prefs.setInt(_diamondsKey, currentDiamonds + amount);
  }

  Future<void> setFastestLevelTime( double time ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('fastest_level_time', time.toInt());
  }

  Future<void> setFastestLevelCompleted( int level ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('fastest_level_completed', level);
  }

  Future<int> getFastestLevelTime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('fastest_level_time') ?? 0;
  }

  Future<int> getFastestLevelCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('fastest_level_completed') ?? 0;
  }

}