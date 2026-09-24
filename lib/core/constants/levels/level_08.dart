import 'package:geometry_dash/core/constants/levels/level_object.dart';
import './level.dart';

final level8 = Level(
  endColumn: 111,
  objects: [

    LevelObject(type: LevelObjectType.platform, column: 12, row: 1.5, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 14.5, row: 4),
    LevelObject(type: LevelObjectType.spike, column: 18.5, row: 0),

    LevelObject(type: LevelObjectType.jumpPad, column: 22, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 26, row: 0, columns: 1, rows: 2),
    LevelObject(type: LevelObjectType.platform, column: 28.5, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.spike, column: 29.7, row: 0),

    LevelObject(type: LevelObjectType.jumpRing, column: 33, row: 3),
    LevelObject(type: LevelObjectType.platform, column: 36, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 41, row: 0),
    LevelObject(type: LevelObjectType.shield, column: 42.5, row: 1.5),

    LevelObject(type: LevelObjectType.speedPortal, column: 46, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 49, row: 1.5, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 54, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 57, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.platform, column: 59.5, row: 0, columns: 1, rows: 3),
    LevelObject(type: LevelObjectType.diamond, column: 61, row: 5),

    LevelObject(type: LevelObjectType.platform, column: 64, row: 2, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.jumpRing, column: 69, row: 4),
    LevelObject(type: LevelObjectType.spike, column: 73, row: 0),
    LevelObject(type: LevelObjectType.spike, column: 74, row: 0),

    LevelObject(type: LevelObjectType.platform, column: 77, row: 1.2, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.jumpPad, column: 83, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 90, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.spike, column: 91.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 92.5, row: 0, columns: 1, rows: 3),
    LevelObject(type: LevelObjectType.diamond, column: 94, row: 5),

    LevelObject(type: LevelObjectType.platform, column: 97, row: 2, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 103, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 105, row: 1.2, columns: 3, rows: .5),
    LevelObject(type: LevelObjectType.jumpRing, column: 107, row: 4),
  ],
);