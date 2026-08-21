import 'package:equatable/equatable.dart';
import 'obstacle.dart';

class Level extends Equatable {
  final String id;

  final List<Obstacle> obstacles;

  const Level({
    required this.id,
    required this.obstacles,
  });

  Level copyWith({
    String? id,
    List<Obstacle>? obstacles,
  }) {
    return Level(
      id: id ?? this.id,
      obstacles: obstacles ?? this.obstacles,
    );
  }

  @override
  List<Object> get props => [id, obstacles];
}