import 'package:geometry_dash/core/constants/levels/level_object.dart';
import './level.dart';

final level2 = Level(
  endColumn: 65,
  objects: [

    LevelObject(type: LevelObjectType.platform, column: 12, row: 0, columns: 1, rows: 2),
    LevelObject(type: LevelObjectType.diamond, column: 12.5, row: 4),
    LevelObject(type: LevelObjectType.spike, column: 14.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 16, row: 0, columns: 1, rows: 2.5),

    LevelObject(type: LevelObjectType.jumpPad, column: 20, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 24, row: 1.5, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.shield, column: 27.5, row: 3.0),
    LevelObject(type: LevelObjectType.spike, column: 29, row: 0),
    LevelObject(type: LevelObjectType.jumpRing, column: 32, row: 3),

    LevelObject(type: LevelObjectType.platform, column: 36, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 41, row: 0),
    LevelObject(type: LevelObjectType.speedPortal, column: 44, row: 0),

    LevelObject(type: LevelObjectType.platform, column: 47, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.spike, column: 48.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 49.6, row: 0, columns: 1, rows: 3),
    LevelObject(type: LevelObjectType.platform, column: 52.2, row: 1.5, columns: 4.5, rows: .5),

    LevelObject(type: LevelObjectType.diamond, column: 55, row: 4),
    LevelObject(type: LevelObjectType.spike, column: 59, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 61, row: 1.2, columns: 3, rows: .5),
  ],
);