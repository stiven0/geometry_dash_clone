import 'package:geometry_dash/core/constants/levels/level_object.dart';
import './level.dart';

final level10 = Level(
  endColumn: 128,
  objects: [

    LevelObject(type: LevelObjectType.spike, column: 12, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 14, row: 0, columns: 1, rows: 2),
    LevelObject(type: LevelObjectType.diamond, column: 14.5, row: 4),
    LevelObject(type: LevelObjectType.spike, column: 16.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 19, row: 1.5, columns: 3.5, rows: .5),

    LevelObject(type: LevelObjectType.jumpPad, column: 23, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 27, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.jumpRing, column: 32, row: 3),
    LevelObject(type: LevelObjectType.spike, column: 36, row: 0),

    LevelObject(type: LevelObjectType.speedPortal, column: 40, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 43, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.platform, column: 45.5, row: 0, columns: 1, rows: 3),
    LevelObject(type: LevelObjectType.platform, column: 48, row: 1.5, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 50, row: 5),

    LevelObject(type: LevelObjectType.spike, column: 55, row: 0),
    LevelObject(type: LevelObjectType.jumpRing, column: 59, row: 4),
    LevelObject(type: LevelObjectType.platform, column: 62, row: 2, columns: 4.5, rows: .5),

    LevelObject(type: LevelObjectType.jumpPad, column: 69, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 73, row: 1.2, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 79, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 82, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.platform, column: 84.5, row: 0, columns: 1, rows: 3),

    LevelObject(type: LevelObjectType.jumpRing, column: 88, row: 4),
    LevelObject(type: LevelObjectType.diamond, column: 89, row: 5),
    LevelObject(type: LevelObjectType.speedPortal, column: 93, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 96, row: 1.5, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 102, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 105, row: 2, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.jumpRing, column: 110, row: 4),
    LevelObject(type: LevelObjectType.spike, column: 116, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 119, row: 1.2, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 124, row: 0),
  ],
);