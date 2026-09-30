import 'package:geometry_dash/core/constants/levels/level_object.dart';
import './level.dart';

final level29 = Level(
  endColumn: 141,
  objects: [
    // Opening: stairs then ring
    LevelObject(type: LevelObjectType.platform, column: 12, row: 0, columns: 1, rows: 1.5),
    LevelObject(type: LevelObjectType.spike, column: 13.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 14.6, row: 0, columns: 1, rows: 2),
    LevelObject(type: LevelObjectType.spike, column: 15.8, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 17.2, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.jumpRing, column: 21, row: 3.5),
    LevelObject(type: LevelObjectType.platform, column: 24, row: 2, columns: 3.5, rows: .5),

    // Mid: aerial rings stretch
    LevelObject(type: LevelObjectType.diamond, column: 26, row: 5),
    LevelObject(type: LevelObjectType.spike, column: 31, row: 0),
    LevelObject(type: LevelObjectType.jumpRing, column: 34, row: 3),
    LevelObject(type: LevelObjectType.shield, column: 36.5, row: 2.4),
    LevelObject(type: LevelObjectType.jumpRing, column: 39, row: 4),
    LevelObject(type: LevelObjectType.platform, column: 42, row: 1.5, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.jumpPad, column: 48, row: 0),

    LevelObject(type: LevelObjectType.spike, column: 52, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 55, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.spike, column: 56.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 58, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.speedPortal, column: 64, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 67, row: 1.5, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 69.5, row: 5),
    LevelObject(type: LevelObjectType.spike, column: 76, row: 0),

    LevelObject(type: LevelObjectType.jumpPad, column: 80, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 84, row: 1.2, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.jumpRing, column: 90, row: 4),
    LevelObject(type: LevelObjectType.speedPortal, column: 95, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 98, row: 0, columns: 1, rows: 3),
    LevelObject(type: LevelObjectType.spike, column: 99.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 101, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 103, row: 5),
    LevelObject(type: LevelObjectType.spike, column: 110, row: 0),
    LevelObject(type: LevelObjectType.jumpRing, column: 114, row: 4),
    LevelObject(type: LevelObjectType.platform, column: 117, row: 1.5, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 123, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 126, row: 0, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 130, row: 4),
    LevelObject(type: LevelObjectType.platform, column: 134, row: 1.5, columns: 4, rows: .5),
  ],
);
