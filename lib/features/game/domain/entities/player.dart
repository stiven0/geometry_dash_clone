import 'position.dart';
import 'velocity.dart';
import 'package:equatable/equatable.dart';

class Player extends Equatable {
  final Position position;
  final Velocity velocity;

  final bool isDead;
  final bool isJumping;

  const Player({
    required this.position,
    required this.velocity,
    this.isDead = false,
    this.isJumping = false,
  });

  Player copyWith({
    Position? position,
    Velocity? velocity,
    bool? isDead,
    bool? isJumping,
  }) {
    return Player(
      position: position ?? this.position,
      velocity: velocity ?? this.velocity,
      isDead: isDead ?? this.isDead,
      isJumping: isJumping ?? this.isJumping,
    );
  }

  @override
  List<Object> get props => [position, velocity, isDead, isJumping];
}