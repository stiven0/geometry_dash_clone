import 'package:geometry_dash/core/constants/levels/level_object.dart';
import './level.dart';

final level40 = Level(
  endColumn: 147,
  objects: [
    // Opening: ring-pad-ring
    LevelObject(type: LevelObjectType.jumpRing, column: 13, row: 2.5),
    LevelObject(type: LevelObjectType.jumpPad, column: 17, row: 0),
    LevelObject(type: LevelObjectType.jumpRing, column: 21, row: 3.5),
    LevelObject(type: LevelObjectType.platform, column: 24, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 30, row: 0),
    LevelObject(type: LevelObjectType.diamond, column: 33, row: 4),

    LevelObject(type: LevelObjectType.platform, column: 36, row: 0, columns: 1, rows: 2),
    LevelObject(type: LevelObjectType.spike, column: 37.2, row: 0),
    LevelObject(type: LevelObjectType.shield, column: 39, row: 1.8),
    LevelObject(type: LevelObjectType.platform, column: 42, row: 1.5, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.speedPortal, column: 48, row: 0),
    LevelObject(type: LevelObjectType.spike, column: 51, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 54, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.jumpPad, column: 60, row: 0),

    LevelObject(type: LevelObjectType.platform, column: 64, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.platform, column: 66.5, row: 0, columns: 1, rows: 3),
    LevelObject(type: LevelObjectType.jumpRing, column: 70, row: 4),
    LevelObject(type: LevelObjectType.diamond, column: 72, row: 5),
    LevelObject(type: LevelObjectType.spike, column: 78, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 81, row: 1.2, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 87, row: 0),
    LevelObject(type: LevelObjectType.spike, column: 88.1, row: 0),

    LevelObject(type: LevelObjectType.jumpPad, column: 92, row: 0),
    LevelObject(type: LevelObjectType.speedPortal, column: 97, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 100, row: 1.5, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.jumpRing, column: 106, row: 4),
    LevelObject(type: LevelObjectType.platform, column: 109, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 111, row: 5),
    LevelObject(type: LevelObjectType.spike, column: 118, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 121, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.spike, column: 122.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 124, row: 1.5, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 128, row: 4),
    LevelObject(type: LevelObjectType.spike, column: 134, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 137, row: 0, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.jumpRing, column: 143, row: 3),
  ],
);
