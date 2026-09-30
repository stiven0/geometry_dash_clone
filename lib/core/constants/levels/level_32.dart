import 'package:geometry_dash/core/constants/levels/level_object.dart';
import './level.dart';

final level32 = Level(
  endColumn: 146,
  objects: [
    // Opening: early speed portal
    LevelObject(type: LevelObjectType.platform, column: 12, row: 0, columns: 2, rows: .5),
    LevelObject(type: LevelObjectType.speedPortal, column: 16, row: 0),
    LevelObject(type: LevelObjectType.spike, column: 19, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 22, row: 1.5, columns: 3.5, rows: .5),
    LevelObject(type: LevelObjectType.jumpRing, column: 27, row: 3),
    LevelObject(type: LevelObjectType.platform, column: 30, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 32, row: 5),

    // Mid: dense stair climb
    LevelObject(type: LevelObjectType.spike, column: 36, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 39, row: 0, columns: 1, rows: 1.5),
    LevelObject(type: LevelObjectType.spike, column: 40.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 41.5, row: 0, columns: 1, rows: 2),
    LevelObject(type: LevelObjectType.spike, column: 42.7, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 44, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.shield, column: 45.5, row: 3.2),
    LevelObject(type: LevelObjectType.platform, column: 47, row: 1.5, columns: 4, rows: .5),

    LevelObject(type: LevelObjectType.jumpPad, column: 53, row: 0),
    LevelObject(type: LevelObjectType.spike, column: 57, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 60, row: 2, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.jumpRing, column: 66, row: 4),
    LevelObject(type: LevelObjectType.platform, column: 69, row: 1.2, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 72, row: 4),

    LevelObject(type: LevelObjectType.spike, column: 78, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 81, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.platform, column: 83.5, row: 0, columns: 1, rows: 3),
    LevelObject(type: LevelObjectType.jumpPad, column: 87, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 91, row: 2, columns: 4, rows: .5),

    LevelObject(type: LevelObjectType.speedPortal, column: 97, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 100, row: 1.5, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 106, row: 0),
    LevelObject(type: LevelObjectType.jumpRing, column: 110, row: 4),
    LevelObject(type: LevelObjectType.platform, column: 113, row: 2, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 115.5, row: 5),
    LevelObject(type: LevelObjectType.spike, column: 122, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 125, row: 0, columns: 1, rows: 2),
    LevelObject(type: LevelObjectType.platform, column: 128, row: 1.2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 134, row: 0),
    LevelObject(type: LevelObjectType.diamond, column: 138, row: 4),
    LevelObject(type: LevelObjectType.platform, column: 142, row: 0, columns: 3, rows: .5),
  ],
);
