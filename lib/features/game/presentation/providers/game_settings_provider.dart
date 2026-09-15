import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geometry_dash/core/services/storage/storage_service.dart';
import 'package:geometry_dash/features/game/data/repositories/game_settings_local_data_source_impl.dart';
import 'package:geometry_dash/features/game/data/repositories/game_settings_repository_impl.dart';
import 'package:geometry_dash/features/game/domain/repositories/game_settings_repository.dart';

const double kPlayerSpeedMin = 300.0;
const double kPlayerSpeedMax = 600.0;
const double kPlayerSpeedDefault = kPlayerSpeedMin;

final gameSettingsProvider = StateNotifierProvider<GameSettingsNotifier, GameSettingsState>((ref) {
  final localDataSource = GameSettingsLocalDataSourceImpl(StorageService());
  final repository = GameSettingsRepositoryImpl(localDataSource);
  return GameSettingsNotifier(repository);
});

class GameSettingsNotifier extends StateNotifier<GameSettingsState> {
  final GameSettingsRepository repository;

  GameSettingsNotifier(this.repository)
      : super(const GameSettingsState(
          playerStartSpeed: kPlayerSpeedDefault,
        ));

  Future<void> loadSettings() async {
    final savedSpeed = await repository.getPlayerStartSpeed();
    final normalizedSpeed = _normalizeSpeed(savedSpeed);

    state = state.copyWith(
      playerStartSpeed: normalizedSpeed,
    );
  }

  Future<void> setPlayerStartSpeed(double speed) async {
    final normalizedSpeed = _normalizeSpeed(speed);
    await repository.setPlayerStartSpeed(normalizedSpeed);

    state = state.copyWith(
      playerStartSpeed: normalizedSpeed,
    );
  }

  double _normalizeSpeed(double speed) {
    return speed.clamp(kPlayerSpeedMin, kPlayerSpeedMax).toDouble();
  }
}

class GameSettingsState {
  final double playerStartSpeed;

  const GameSettingsState({
    this.playerStartSpeed = kPlayerSpeedDefault,
  });

  GameSettingsState copyWith({
    double? playerStartSpeed,
  }) {
    return GameSettingsState(
      playerStartSpeed: playerStartSpeed ?? this.playerStartSpeed,
    );
  }
}