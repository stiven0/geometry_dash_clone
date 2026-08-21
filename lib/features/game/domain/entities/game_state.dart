import 'package:equatable/equatable.dart';

enum GameStatus {
  menu,
  playing,
  paused,
  gameOver,
}

class GameState extends Equatable {
  final GameStatus status;

  final int score;

  final double distance;

  const GameState({
    this.status = GameStatus.menu,
    this.score = 0,
    this.distance = 0.0,
  });

  GameState copyWith({
    GameStatus? status,
    int? score,
    double? distance,
  }) {
    return GameState(
      status: status ?? this.status,
      score: score ?? this.score,
      distance: distance ?? this.distance,
    );
  }

  @override
  List<Object> get props => [status, score, distance];
}