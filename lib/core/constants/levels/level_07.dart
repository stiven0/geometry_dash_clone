import 'package:geometry_dash/core/constants/levels/level_object.dart';
import './level.dart';

final level7 = Level(
  endColumn: 112,
  objects: [

    LevelObject(type: LevelObjectType.platform, column: 12, row: 0, columns: 1, rows: 2),
    LevelObject(type: LevelObjectType.diamond, column: 12.5, row: 4),
    LevelObject(type: LevelObjectType.spike, column: 14.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 16, row: 0, columns: 1, rows: 2.5),

    LevelObject(type: LevelObjectType.jumpPad, column: 20, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 24, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 29, row: 0),
    LevelObject(type: LevelObjectType.jumpRing, column: 32, row: 3),
    LevelObject(type: LevelObjectType.speedPortal, column: 35, row: 0),

    LevelObject(type: LevelObjectType.platform, column: 38, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.platform, column: 40.6, row: 0, columns: 1, rows: 3),
    LevelObject(type: LevelObjectType.platform, column: 43.2, row: 1.5, columns: 4.5, rows: .5),

    LevelObject(type: LevelObjectType.diamond, column: 46, row: 5),
    LevelObject(type: LevelObjectType.spike, column: 51, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 54, row: 2, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.jumpRing, column: 58, row: 4),

    LevelObject(type: LevelObjectType.spike, column: 63, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 67, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.spike, column: 68.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 69.6, row: 0, columns: 1, rows: 3),
    LevelObject(type: LevelObjectType.jumpPad, column: 73, row: 0),

    LevelObject(type: LevelObjectType.platform, column: 77, row: 1.5, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.platform, column: 86, row: 2, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 88.5, row: 5),
    LevelObject(type: LevelObjectType.spike, column: 94, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 98, row: 0, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.jumpRing, column: 104, row: 4),
  ],
);