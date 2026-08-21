import 'position.dart';
import 'package:equatable/equatable.dart';

class Obstacle extends Equatable {
  final Position position;
  final double width;
  final double height;

  const Obstacle({
    required this.position,
    required this.width,
    required this.height,
  });

  Obstacle copyWith({
    Position? position,
    double? width,
    double? height,
  }) {
    return Obstacle(
      position: position ?? this.position,
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }

  @override
  List<Object> get props => [position, width, height];

}