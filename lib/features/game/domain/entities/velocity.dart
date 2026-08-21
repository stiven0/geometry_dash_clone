import 'package:equatable/equatable.dart';

class Velocity extends Equatable {
  final double dx;
  final double dy;

  const Velocity({required this.dx, required this.dy});

  Velocity copyWith({double? dx, double? dy}) {
    return Velocity(dx: dx ?? this.dx, dy: dy ?? this.dy);
  }

  @override
  List<Object> get props => [dx, dy];

}