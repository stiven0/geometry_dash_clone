import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geometry_dash/core/services/storage/storage_service.dart';
import 'package:geometry_dash/features/menu/data/repositories/progress_local_data_source_impl.dart';
import 'package:geometry_dash/features/menu/data/repositories/progress_repository_impl.dart';
import 'package:geometry_dash/features/menu/domain/repositories/progress_repository.dart';

final progressStateProvider = StateNotifierProvider<ProgressStateNotifier, ProgressState>((ref) {
  final localDataSource = ProgressLocalDataSourceImpl(StorageService());
  final repository = ProgressRepositoryImpl(localDataSource);
  return ProgressStateNotifier(repository);
});

class ProgressStateNotifier extends StateNotifier<ProgressState> {
  final ProgressRepository repository;

  ProgressStateNotifier(this.repository) : super(const ProgressState());

  Future<void> loadProgress() async {
    final unlocked = await repository.getUnlockedLevel();
    state = state.copyWith(unlockedLevel: unlocked);
  }

  void selectLevel(int level) {
    state = state.copyWith(selectedLevel: level);
  }

  Future<void> unlockLevel(int level) async {
    await repository.unlockLevel(level);
    if (level > state.unlockedLevel) {
      state = state.copyWith(unlockedLevel: level);
    }
  }
}

class ProgressState {
  final int unlockedLevel;
  final int selectedLevel;

  const ProgressState({this.unlockedLevel = 1, this.selectedLevel = 1});

  ProgressState copyWith({int? unlockedLevel, int? selectedLevel}) {
    return ProgressState(
      unlockedLevel: unlockedLevel ?? this.unlockedLevel,
      selectedLevel: selectedLevel ?? this.selectedLevel,
    );
  }
}
