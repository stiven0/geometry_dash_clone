import 'package:geometry_dash/core/constants/levels/level_object.dart';
import './level.dart';

final level41 = Level(
  endColumn: 147,
  objects: [
    // Opening: ground run then sudden stairs
    LevelObject(type: LevelObjectType.spike, column: 12, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 15, row: 0, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 20, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 23, row: 0, columns: 3, rows: .5),
    LevelObject(type: LevelObjectType.platform, column: 28, row: 0, columns: 1, rows: 1.5),
    LevelObject(type: LevelObjectType.spike, column: 29.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 30.6, row: 0, columns: 1, rows: 2),
    LevelObject(type: LevelObjectType.spike, column: 31.8, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 33.2, row: 0, columns: 1, rows: 2.5),

    LevelObject(type: LevelObjectType.shield, column: 36, row: 3.0),
    LevelObject(type: LevelObjectType.jumpRing, column: 38, row: 3.5),
    LevelObject(type: LevelObjectType.platform, column: 41, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 43, row: 5),
    LevelObject(type: LevelObjectType.jumpPad, column: 48, row: 0),
    LevelObject(type: LevelObjectType.spike, column: 52, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 55, row: 1.5, columns: 4.5, rows: .5),

    LevelObject(type: LevelObjectType.speedPortal, column: 61, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 64, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.spike, column: 65.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 67, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.jumpRing, column: 73, row: 4),
    LevelObject(type: LevelObjectType.diamond, column: 75, row: 5),
    LevelObject(type: LevelObjectType.spike, column: 81, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 84, row: 1.2, columns: 5, rows: .5),

    LevelObject(type: LevelObjectType.jumpPad, column: 91, row: 0),
    LevelObject(type: LevelObjectType.speedPortal, column: 96, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 99, row: 1.5, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 105, row: 0),
    LevelObject(type: LevelObjectType.jumpRing, column: 109, row: 4),
    LevelObject(type: LevelObjectType.platform, column: 112, row: 2, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 114.5, row: 5),
    LevelObject(type: LevelObjectType.spike, column: 121, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 124, row: 0, columns: 1, rows: 3),
    LevelObject(type: LevelObjectType.platform, column: 127, row: 1.5, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 133, row: 0),
    LevelObject(type: LevelObjectType.diamond, column: 137, row: 4),
    LevelObject(type: LevelObjectType.platform, column: 141, row: 0, columns: 4, rows: .5),
  ],
);
