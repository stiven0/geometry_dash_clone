import 'package:geometry_dash/core/constants/levels/level_object.dart';
import './level.dart';

final level38 = Level(
  endColumn: 142,
  objects: [
    // Opening: triple spike
    LevelObject(type: LevelObjectType.spike, column: 12, row: 0),
    LevelObject(type: LevelObjectType.spike, column: 13.1, row: 0),
    LevelObject(type: LevelObjectType.spike, column: 14.2, row: 0),
    LevelObject(type: LevelObjectType.jumpPad, column: 17, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 21, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.jumpRing, column: 27, row: 3.5),
    LevelObject(type: LevelObjectType.platform, column: 30, row: 1.5, columns: 3.5, rows: .5),

    LevelObject(type: LevelObjectType.diamond, column: 32, row: 4),
    LevelObject(type: LevelObjectType.spike, column: 37, row: 0),
    LevelObject(type: LevelObjectType.shield, column: 39.5, row: 1.5),
    LevelObject(type: LevelObjectType.platform, column: 42, row: 0, columns: 1, rows: 2),
    LevelObject(type: LevelObjectType.platform, column: 44.5, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.spike, column: 45.7, row: 0),
    LevelObject(type: LevelObjectType.jumpRing, column: 49, row: 4),

    LevelObject(type: LevelObjectType.speedPortal, column: 54, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 57, row: 1.8, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 63, row: 0),
    LevelObject(type: LevelObjectType.jumpPad, column: 67, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 71, row: 2, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 73.5, row: 5),

    LevelObject(type: LevelObjectType.spike, column: 80, row: 0),
    LevelObject(type: LevelObjectType.spike, column: 81.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 84, row: 1.2, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.jumpRing, column: 90, row: 4),
    LevelObject(type: LevelObjectType.speedPortal, column: 95, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 98, row: 0, columns: 1, rows: 3),
    LevelObject(type: LevelObjectType.spike, column: 99.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 101, row: 1.5, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 103.5, row: 5),
    LevelObject(type: LevelObjectType.jumpRing, column: 109, row: 4),
    LevelObject(type: LevelObjectType.spike, column: 114, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 117, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 123, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 126, row: 0, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 130, row: 4),
    LevelObject(type: LevelObjectType.platform, column: 134, row: 1.5, columns: 4, rows: .5),
  ],
);
