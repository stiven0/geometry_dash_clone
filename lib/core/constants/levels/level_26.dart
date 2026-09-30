import 'package:geometry_dash/core/constants/levels/level_object.dart';
import './level.dart';

final level26 = Level(
  endColumn: 136,
  objects: [
    // Opening: double jumpPad burst
    LevelObject(type: LevelObjectType.jumpPad, column: 13, row: 0),
    LevelObject(type: LevelObjectType.spike, column: 17, row: 0),
    LevelObject(type: LevelObjectType.jumpPad, column: 20, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 24, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 26, row: 5),
    LevelObject(type: LevelObjectType.spike, column: 31, row: 0),

    // Mid: low corridor + shield near ground
    LevelObject(type: LevelObjectType.platform, column: 34, row: 0, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.shield, column: 37, row: 1.2),
    LevelObject(type: LevelObjectType.spike, column: 40, row: 0),
    LevelObject(type: LevelObjectType.jumpRing, column: 43, row: 3),
    LevelObject(type: LevelObjectType.platform, column: 46, row: 1.5, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.speedPortal, column: 52, row: 0),

    LevelObject(type: LevelObjectType.platform, column: 55, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.spike, column: 56.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 58, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.jumpRing, column: 64, row: 4),
    LevelObject(type: LevelObjectType.diamond, column: 66, row: 5),
    LevelObject(type: LevelObjectType.spike, column: 72, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 75, row: 1.2, columns: 5, rows: .5),

    LevelObject(type: LevelObjectType.jumpPad, column: 82, row: 0),
    LevelObject(type: LevelObjectType.spike, column: 86, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 89, row: 2, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.speedPortal, column: 95, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 98, row: 0, columns: 1, rows: 3),
    LevelObject(type: LevelObjectType.spike, column: 99.2, row: 0),
    LevelObject(type: LevelObjectType.jumpRing, column: 103, row: 4),
    LevelObject(type: LevelObjectType.platform, column: 106, row: 1.5, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 108.5, row: 5),
    LevelObject(type: LevelObjectType.spike, column: 115, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 118, row: 0, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 124, row: 0),
    LevelObject(type: LevelObjectType.diamond, column: 128, row: 4),
    LevelObject(type: LevelObjectType.platform, column: 131, row: 1.5, columns: 4, rows: .5),
  ],
);
