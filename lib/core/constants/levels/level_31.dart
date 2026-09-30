import 'package:geometry_dash/core/constants/levels/level_object.dart';
import './level.dart';

final level31 = Level(
  endColumn: 133,
  objects: [
    // Opening: high floating platform first
    LevelObject(type: LevelObjectType.platform, column: 12, row: 1.8, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 17.5, row: 0),
    LevelObject(type: LevelObjectType.jumpPad, column: 21, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 25, row: 0, columns: 1, rows: 2),
    LevelObject(type: LevelObjectType.platform, column: 27.5, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.spike, column: 28.8, row: 0),
    LevelObject(type: LevelObjectType.diamond, column: 29.5, row: 4),

    // Mid: double-spike gauntlet
    LevelObject(type: LevelObjectType.jumpRing, column: 33, row: 3),
    LevelObject(type: LevelObjectType.platform, column: 36, row: 2, columns: 3.5, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 41, row: 0),
    LevelObject(type: LevelObjectType.spike, column: 42.2, row: 0),
    LevelObject(type: LevelObjectType.shield, column: 43.5, row: 1.4),
    LevelObject(type: LevelObjectType.platform, column: 46, row: 1.2, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 52, row: 0),
    LevelObject(type: LevelObjectType.spike, column: 53.1, row: 0),

    LevelObject(type: LevelObjectType.jumpPad, column: 57, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 61, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 63, row: 5),
    LevelObject(type: LevelObjectType.speedPortal, column: 68, row: 0),

    LevelObject(type: LevelObjectType.platform, column: 71, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.spike, column: 72.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 74, row: 1.5, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.jumpRing, column: 80, row: 4),
    LevelObject(type: LevelObjectType.spike, column: 84, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 87, row: 2, columns: 4.5, rows: .5),

    LevelObject(type: LevelObjectType.speedPortal, column: 93, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 96, row: 0, columns: 1, rows: 3),
    LevelObject(type: LevelObjectType.spike, column: 97.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 99, row: 1.5, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 101, row: 5),
    LevelObject(type: LevelObjectType.jumpRing, column: 106, row: 4),
    LevelObject(type: LevelObjectType.spike, column: 111, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 114, row: 1.2, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 120, row: 0),
    LevelObject(type: LevelObjectType.diamond, column: 124, row: 4),
    LevelObject(type: LevelObjectType.platform, column: 128, row: 0, columns: 4, rows: .5),
  ],
);
