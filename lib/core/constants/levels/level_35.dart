import 'package:geometry_dash/core/constants/levels/level_object.dart';
import './level.dart';

final level35 = Level(
  endColumn: 141,
  objects: [
    // Opening: stairs first, diamond late
    LevelObject(type: LevelObjectType.platform, column: 12, row: 0, columns: 1, rows: 1.5),
    LevelObject(type: LevelObjectType.spike, column: 13.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 14.6, row: 0, columns: 1, rows: 2),
    LevelObject(type: LevelObjectType.spike, column: 15.8, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 17.2, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.platform, column: 20, row: 1.5, columns: 3.5, rows: .5),
    LevelObject(type: LevelObjectType.jumpRing, column: 25, row: 3),

    // Mid: jump-pad burst stretch
    LevelObject(type: LevelObjectType.jumpPad, column: 29, row: 0),
    LevelObject(type: LevelObjectType.spike, column: 33, row: 0),
    LevelObject(type: LevelObjectType.jumpPad, column: 36, row: 0),
    LevelObject(type: LevelObjectType.shield, column: 38, row: 2.6),
    LevelObject(type: LevelObjectType.platform, column: 40, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 42, row: 5),
    LevelObject(type: LevelObjectType.spike, column: 47, row: 0),

    LevelObject(type: LevelObjectType.speedPortal, column: 51, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 54, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.spike, column: 55.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 57, row: 1.5, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.jumpRing, column: 63, row: 4),
    LevelObject(type: LevelObjectType.platform, column: 66, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 68, row: 5),

    LevelObject(type: LevelObjectType.spike, column: 74, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 77, row: 1.2, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.jumpPad, column: 84, row: 0),
    LevelObject(type: LevelObjectType.spike, column: 88, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 91, row: 2, columns: 4.5, rows: .5),

    LevelObject(type: LevelObjectType.speedPortal, column: 97, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 100, row: 0, columns: 1, rows: 3),
    LevelObject(type: LevelObjectType.spike, column: 101.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 103, row: 1.5, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.jumpRing, column: 109, row: 4),
    LevelObject(type: LevelObjectType.diamond, column: 111, row: 5),
    LevelObject(type: LevelObjectType.spike, column: 116, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 119, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 125, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 128, row: 0, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 132, row: 4),
    LevelObject(type: LevelObjectType.platform, column: 136, row: 1.5, columns: 4, rows: .5),
  ],
);
