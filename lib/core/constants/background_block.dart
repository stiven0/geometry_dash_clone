import 'package:flutter/material.dart';

class BackgroundBlock {

  double x;
  double y;
  double width;
  double height;
  double speed;

  BackgroundBlock({
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    required this.speed,
  });

  Rect get rect => Rect.fromLTWH(
    x,
    y,
    width,
    height,
  );
}