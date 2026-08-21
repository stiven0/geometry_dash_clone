import 'package:flutter_test/flutter_test.dart';
import 'package:geometry_dash/features/menu/domain/repositories/progress_repository.dart';
import 'package:geometry_dash/features/menu/presentation/providers/progress_state_provider.dart';

class FakeProgressRepository implements ProgressRepository {
  int unlockedLevel = 1;
  int selectedLevel = 1;

  @override
  Future<int> getUnlockedLevel() async => unlockedLevel;

  @override
  Future<void> unlockLevel(int level) async {
    if (level > unlockedLevel) {
      unlockedLevel = level;
    }
  }
}

void main() {
  group('ProgressStateNotifier', () {
    late FakeProgressRepository repository;
    late ProgressStateNotifier notifier;

    setUp(() {
      repository = FakeProgressRepository();
      notifier = ProgressStateNotifier(repository);
    });

    test('initial state is default', () {
      expect(notifier.state.unlockedLevel, 1);
      expect(notifier.state.selectedLevel, 1);
    });

    test('selectLevel updates selectedLevel', () {
      notifier.selectLevel(4);
      expect(notifier.state.selectedLevel, 4);
    });

    test('loadProgress updates unlockedLevel from repository', () async {
      repository.unlockedLevel = 5;
      await notifier.loadProgress();
      expect(notifier.state.unlockedLevel, 5);
    });

    test('unlockLevel updates unlockedLevel when level is higher', () async {
      await notifier.unlockLevel(3);
      expect(notifier.state.unlockedLevel, 3);
    });

    test('unlockLevel does not lower unlockedLevel', () async {
      notifier = ProgressStateNotifier(repository);
      await notifier.unlockLevel(2);
      expect(notifier.state.unlockedLevel, 2);
      await notifier.unlockLevel(1);
      expect(notifier.state.unlockedLevel, 2);
    });
  });
}
