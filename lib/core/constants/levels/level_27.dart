import 'package:geometry_dash/core/constants/levels/level_object.dart';
import './level.dart';

final level27 = Level(
  endColumn: 137,
  objects: [
    // Opening: high floating platform
    LevelObject(type: LevelObjectType.platform, column: 12, row: 2.2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 14, row: 5),
    LevelObject(type: LevelObjectType.spike, column: 18, row: 0),
    LevelObject(type: LevelObjectType.jumpRing, column: 21, row: 3),
    LevelObject(type: LevelObjectType.platform, column: 24, row: 1.5, columns: 3.5, rows: .5),
    LevelObject(type: LevelObjectType.jumpPad, column: 29, row: 0),

    // Mid: double-spike gauntlet
    LevelObject(type: LevelObjectType.spike, column: 33, row: 0),
    LevelObject(type: LevelObjectType.spike, column: 34.2, row: 0),
    LevelObject(type: LevelObjectType.shield, column: 36, row: 1.5),
    LevelObject(type: LevelObjectType.platform, column: 39, row: 1.2, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 45, row: 0),
    LevelObject(type: LevelObjectType.spike, column: 46.1, row: 0),
    LevelObject(type: LevelObjectType.jumpRing, column: 49, row: 4),

    LevelObject(type: LevelObjectType.speedPortal, column: 54, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 57, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.spike, column: 58.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 60, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 62, row: 5),
    LevelObject(type: LevelObjectType.jumpPad, column: 68, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 72, row: 1.5, columns: 5, rows: .5),

    LevelObject(type: LevelObjectType.spike, column: 78, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 81, row: 0, columns: 1, rows: 3),
    LevelObject(type: LevelObjectType.jumpRing, column: 85, row: 4),
    LevelObject(type: LevelObjectType.speedPortal, column: 90, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 93, row: 1.5, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 95.5, row: 5),
    LevelObject(type: LevelObjectType.spike, column: 102, row: 0),
    LevelObject(type: LevelObjectType.jumpPad, column: 106, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 110, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.jumpRing, column: 116, row: 4),
    LevelObject(type: LevelObjectType.spike, column: 121, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 124, row: 0, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 128, row: 4),
    LevelObject(type: LevelObjectType.platform, column: 132, row: 1.5, columns: 4, rows: .5),
  ],
);
