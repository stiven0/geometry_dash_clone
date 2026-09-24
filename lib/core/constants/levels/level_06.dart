import 'package:geometry_dash/core/constants/levels/level_object.dart';
import './level.dart';

final level6 = Level(
  endColumn: 93,
  objects: [

    LevelObject(type: LevelObjectType.platform, column: 12, row: 1.2, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 17, row: 0),
    LevelObject(type: LevelObjectType.jumpPad, column: 20, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 24, row: 0, columns: 1, rows: 2),
    LevelObject(type: LevelObjectType.spike, column: 25.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 26.5, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.diamond, column: 27, row: 4),

    LevelObject(type: LevelObjectType.jumpRing, column: 30, row: 3),
    LevelObject(type: LevelObjectType.platform, column: 33, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.shield, column: 35.5, row: 2.8),
    LevelObject(type: LevelObjectType.spike, column: 38, row: 0),

    LevelObject(type: LevelObjectType.speedPortal, column: 41, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 44, row: 1.5, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 49, row: 0),

    LevelObject(type: LevelObjectType.platform, column: 53, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.spike, column: 54.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 55.5, row: 0, columns: 1, rows: 3),
    LevelObject(type: LevelObjectType.jumpRing, column: 59, row: 4),
    LevelObject(type: LevelObjectType.diamond, column: 60, row: 5),

    LevelObject(type: LevelObjectType.platform, column: 63, row: 2, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 68, row: 0),

    LevelObject(type: LevelObjectType.platform, column: 71, row: 0, columns: 1, rows: 2),
    LevelObject(type: LevelObjectType.platform, column: 74, row: 1.2, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.jumpPad, column: 80, row: 0),
    LevelObject(type: LevelObjectType.spike, column: 84, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 87, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 89, row: 5),
  ],
);