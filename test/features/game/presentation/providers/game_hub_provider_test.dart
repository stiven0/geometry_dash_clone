import 'package:flutter_test/flutter_test.dart';
import 'package:geometry_dash/features/game/domain/repositories/game_repository.dart';
import 'package:geometry_dash/features/game/presentation/providers/game_hub_provider.dart';

class FakeGameRepository implements GameRepository {
  int diamonds = 0;
  double fastestLevelTime = 0;
  int fastestLevelCompleted = 0;

  @override
  Future<void> addDiamonds(int amount) async {
    diamonds += amount;
  }

  @override
  Future<int> getDiamonds() async => diamonds;

  @override
  Future<int> getFastestLevelCompleted() async => fastestLevelCompleted;

  @override
  Future<double> getFastestLevelTime() async => fastestLevelTime.toDouble();

  @override
  Future<void> setFastestLevelCompleted(int level) async {
    fastestLevelCompleted = level;
  }

  @override
  Future<void> setFastestLevelTime(double time) async {
    fastestLevelTime = time;
  }
}

void main() {
  group('GameHubNotifier', () {
    late FakeGameRepository repository;
    late GameHubNotifier notifier;

    setUp(() {
      repository = FakeGameRepository();
      notifier = GameHubNotifier(repository);
    });

    test('initial state has default values', () {
      expect(notifier.state.diamonds, 0);
      expect(notifier.state.progress, 0);
      expect(notifier.state.fastestLevelTime, 0);
      expect(notifier.state.fastestLevelCompleted, 0);
      expect(notifier.state.currentLevel, 0);
    });

    test('updateProgress changes progress once', () {
      notifier.updateProgress(0.5);
      expect(notifier.state.progress, 0.5);
    });

    test('addDiamond increments diamonds and repository', () async {
      await notifier.addDiamond();
      expect(notifier.state.diamonds, 1);
      expect(repository.diamonds, 1);
    });

    test('loadInitialData loads state from repository', () async {
      repository.diamonds = 7;
      repository.fastestLevelTime = 12;
      repository.fastestLevelCompleted = 4;

      await notifier.loadInitialData();

      expect(notifier.state.diamonds, 7);
      expect(notifier.state.fastestLevelTime, 12.0);
      expect(notifier.state.fastestLevelCompleted, 4);
    });

    test('updateFastestLevelTime updates state when lower', () async {
      notifier = GameHubNotifier(repository);
      await notifier.updateFastestLevelTime(5.1);
      expect(notifier.state.fastestLevelTime, 5.1);
    });

    test('updateFastestLevelCompleted updates state', () async {
      await notifier.updateFastestLevelCompleted(3, 2.5);
      expect(notifier.state.fastestLevelCompleted, 3);
    });
  });
}
