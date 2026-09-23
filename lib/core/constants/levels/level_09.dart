import 'package:geometry_dash/core/constants/levels/level_object.dart';
import './level.dart';

final level9 = Level(
  endColumn: 119,
  objects: [

    LevelObject(type: LevelObjectType.platform, column: 12, row: 1.5, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 14.5, row: 4),
    LevelObject(type: LevelObjectType.spike, column: 18.5, row: 0),

    LevelObject(type: LevelObjectType.jumpPad, column: 21, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 25, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.jumpRing, column: 30, row: 3),
    LevelObject(type: LevelObjectType.spike, column: 34, row: 0),

    LevelObject(type: LevelObjectType.platform, column: 37, row: 0, columns: 1, rows: 2),
    LevelObject(type: LevelObjectType.spike, column: 38.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 39.5, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.platform, column: 42, row: 1.5, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 44.5, row: 5),

    LevelObject(type: LevelObjectType.speedPortal, column: 48, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 51, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.platform, column: 53.5, row: 0, columns: 1, rows: 3),
    LevelObject(type: LevelObjectType.jumpRing, column: 58, row: 4),
    LevelObject(type: LevelObjectType.platform, column: 61, row: 2, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 63, row: 5),

    LevelObject(type: LevelObjectType.spike, column: 68, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 72, row: 1.2, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.jumpPad, column: 78, row: 0),
    LevelObject(type: LevelObjectType.spike, column: 82, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 85, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 87, row: 5),

    LevelObject(type: LevelObjectType.speedPortal, column: 90, row: 0),
    LevelObject(type: LevelObjectType.shield, column: 91.5, row: 2.6),
    LevelObject(type: LevelObjectType.platform, column: 93, row: 1.5, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.jumpRing, column: 103, row: 4),
    LevelObject(type: LevelObjectType.platform, column: 106, row: 0, columns: 1, rows: 3),
    LevelObject(type: LevelObjectType.diamond, column: 107, row: 5),
    LevelObject(type: LevelObjectType.platform, column: 110, row: 1.2, columns: 4.5, rows: .5),
  ],
);