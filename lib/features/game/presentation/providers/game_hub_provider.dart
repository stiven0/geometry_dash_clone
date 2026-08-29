import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geometry_dash/core/services/storage/storage_service.dart';
import 'package:geometry_dash/features/game/data/repositories/game_local_data_source_impl.dart';
import 'package:geometry_dash/features/game/data/repositories/game_repository_impl.dart';
import 'package:geometry_dash/features/game/domain/repositories/game_repository.dart';

final gameHubProvider = StateNotifierProvider<GameHubNotifier, GameHubState>(
  (ref) {
    final localDataSource = GameLocalDataSourceImpl(StorageService());
    final repository = GameRepositoryImpl(localDataSource);
    return GameHubNotifier(repository);
  },
);

class GameHubNotifier extends StateNotifier<GameHubState> {
  final GameRepository repository;

  GameHubNotifier(this.repository) : super(const GameHubState());

  void updateProgress(double value) {
    if (value == state.progress) return;
    state = state.copyWith(progress: value);
  }

  Future<void> updateFastestLevelTime(double value) async {
    if (state.fastestLevelTime > 0 && value >= state.fastestLevelTime) return;
    await repository.setFastestLevelTime(value);
    state = state.copyWith(fastestLevelTime: value);
  }

  Future<void> updateFastestLevelCompleted(int value, double fastestLevelTime) async {
    if (value == state.fastestLevelCompleted) return;
    if (state.fastestLevelTime > 0 && fastestLevelTime >= state.fastestLevelTime) return;
    await repository.setFastestLevelCompleted(value);
    state = state.copyWith(fastestLevelCompleted: value);
  }

  Future<void> loadInitialData() async {
    final diamonds = await repository.getDiamonds();
    final fastestLevelTime = await repository.getFastestLevelTime();
    final fastestLevelCompleted = await repository.getFastestLevelCompleted();

    state = state.copyWith(
      diamonds: diamonds,
      fastestLevelTime: fastestLevelTime.toDouble(),
      fastestLevelCompleted: fastestLevelCompleted,
    );
  }

  void setLevel(int currentLevel) {
    state = state.copyWith(
      currentLevel: currentLevel,
    );
  }

  Future<void> getDiamonds() async {
    final diamonds = await repository.getDiamonds();
    state = state.copyWith(
      diamonds: diamonds,
    );
  }

  Future<void> addDiamond() async {
    await repository.addDiamonds(1);
    state = state.copyWith(
      diamonds: state.diamonds + 1,
    );
  }

  void resetProgress() {
    state = state.copyWith(progress: 0);
  }
}

class GameHubState {

  final double progress;
  final int diamonds;
  final int currentLevel;
  final double fastestLevelTime;
  final int fastestLevelCompleted;

  const GameHubState({
    this.progress = 0,
    this.diamonds = 0,
    this.currentLevel = 0,
    this.fastestLevelTime = 0,
    this.fastestLevelCompleted = 0,
  });

  GameHubState copyWith({
    double? progress,
    int? diamonds,
    int? currentLevel,
    double? fastestLevelTime,
    int? fastestLevelCompleted,
  }) {
    return GameHubState(
      progress: progress ?? this.progress,
      diamonds: diamonds ?? this.diamonds,
      currentLevel: currentLevel ?? this.currentLevel,
      fastestLevelTime: fastestLevelTime ?? this.fastestLevelTime,
      fastestLevelCompleted: fastestLevelCompleted ?? this.fastestLevelCompleted,
    );
  }
}