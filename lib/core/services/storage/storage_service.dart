import 'package:shared_preferences/shared_preferences.dart';

class StorageService {

  static const String _unlockedLevelKey = 'unlocked_level';
  static const String _diamondsKey = 'diamonds';
  static const String _fastestLevelTimeKey = 'fastest_level_time';
  static const String _fastestLevelCompletedKey = 'fastest_level_completed';
  static const String _playerStartSpeedKey = 'player_start_speed';

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
    await prefs.setDouble(_fastestLevelTimeKey, time);
  }

  Future<void> setFastestLevelCompleted( int level ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_fastestLevelCompletedKey, level);
  }

  Future<double> getFastestLevelTime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_fastestLevelTimeKey) ?? 0;
  }

  Future<int> getFastestLevelCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_fastestLevelCompletedKey) ?? 0;
  }

  Future<double> getPlayerStartSpeed() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_playerStartSpeedKey) ?? 300.0;
  }

  Future<void> setPlayerStartSpeed(double speed) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_playerStartSpeedKey, speed);
  }

}