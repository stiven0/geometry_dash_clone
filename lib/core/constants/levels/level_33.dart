import 'package:geometry_dash/core/constants/levels/level_object.dart';
import './level.dart';

final level33 = Level(
  endColumn: 136,
  objects: [
    // Opening: pad first, no early diamond
    LevelObject(type: LevelObjectType.jumpPad, column: 14, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 18, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 23, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 26, row: 0, columns: 1, rows: 2),
    LevelObject(type: LevelObjectType.spike, column: 27.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 29, row: 1.2, columns: 3.5, rows: .5),

    // Mid: low open + groundish shield, then rings
    LevelObject(type: LevelObjectType.spike, column: 34, row: 0),
    LevelObject(type: LevelObjectType.shield, column: 36, row: 1.0),
    LevelObject(type: LevelObjectType.platform, column: 39, row: 0, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.jumpRing, column: 44, row: 3),
    LevelObject(type: LevelObjectType.jumpRing, column: 48, row: 4),
    LevelObject(type: LevelObjectType.platform, column: 51, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 53, row: 5),

    LevelObject(type: LevelObjectType.speedPortal, column: 58, row: 0),
    LevelObject(type: LevelObjectType.spike, column: 61, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 64, row: 1.5, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.jumpPad, column: 70, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 74, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.spike, column: 75.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 77, row: 2, columns: 4.5, rows: .5),

    LevelObject(type: LevelObjectType.jumpRing, column: 83, row: 4),
    LevelObject(type: LevelObjectType.spike, column: 87, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 90, row: 1.2, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 93, row: 4),
    LevelObject(type: LevelObjectType.speedPortal, column: 98, row: 0),

    LevelObject(type: LevelObjectType.platform, column: 101, row: 0, columns: 1, rows: 3),
    LevelObject(type: LevelObjectType.spike, column: 102.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 104, row: 1.5, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.jumpRing, column: 110, row: 4),
    LevelObject(type: LevelObjectType.spike, column: 114, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 117, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 119, row: 5),
    LevelObject(type: LevelObjectType.spike, column: 125, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 129, row: 0, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 132, row: 4),
  ],
);
