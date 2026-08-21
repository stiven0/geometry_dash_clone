import 'package:geometry_dash/core/constants/levels/level_object.dart';
import './level.dart';

final level11 = Level(
  endColumn: 130,
  objects: [

    LevelObject(type: LevelObjectType.platform, column: 12, row: 1.2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.jumpPad, column: 17, row: 0),
    LevelObject(type: LevelObjectType.spike, column: 21, row: 0),
    LevelObject(type: LevelObjectType.diamond, column: 24, row: 4),

    LevelObject(type: LevelObjectType.platform, column: 28, row: 2, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 33, row: 0),
    LevelObject(type: LevelObjectType.jumpRing, column: 36, row: 3),

    LevelObject(type: LevelObjectType.platform, column: 40, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.speedPortal, column: 45, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 48, row: 1.5, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 53, row: 0),

    LevelObject(type: LevelObjectType.platform, column: 56, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.spike, column: 57.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 58.5, row: 0, columns: 1, rows: 3),
    LevelObject(type: LevelObjectType.jumpRing, column: 62, row: 4),
    LevelObject(type: LevelObjectType.diamond, column: 63, row: 5),

    LevelObject(type: LevelObjectType.platform, column: 66, row: 2, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 72, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 75, row: 1.2, columns: 5, rows: .5),

    LevelObject(type: LevelObjectType.jumpPad, column: 82, row: 0),
    LevelObject(type: LevelObjectType.spike, column: 86, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 89, row: 2, columns: 4, rows: .5),

    LevelObject(type: LevelObjectType.speedPortal, column: 94, row: 0),
    LevelObject(type: LevelObjectType.spike, column: 97, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 100, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.spike, column: 101.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 102.5, row: 0, columns: 1, rows: 3),
    LevelObject(type: LevelObjectType.diamond, column: 104, row: 5),

    LevelObject(type: LevelObjectType.jumpRing, column: 108, row: 4),
    LevelObject(type: LevelObjectType.platform, column: 111, row: 1.5, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 117, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 120, row: 2, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 126, row: 0),
  ],
);