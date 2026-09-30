import 'package:geometry_dash/core/constants/levels/level_object.dart';
import './level.dart';

final level37 = Level(
  endColumn: 137,
  objects: [
    // Opening: short warmup then portal
    LevelObject(type: LevelObjectType.spike, column: 12, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 15, row: 1.2, columns: 3, rows: .5),
    LevelObject(type: LevelObjectType.speedPortal, column: 20, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 23, row: 0, columns: 1, rows: 2),
    LevelObject(type: LevelObjectType.spike, column: 24.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 26, row: 1.5, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 28, row: 4),

    LevelObject(type: LevelObjectType.jumpRing, column: 33, row: 3),
    LevelObject(type: LevelObjectType.spike, column: 37, row: 0),
    LevelObject(type: LevelObjectType.shield, column: 39, row: 2.0),
    LevelObject(type: LevelObjectType.platform, column: 42, row: 2, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.jumpPad, column: 48, row: 0),
    LevelObject(type: LevelObjectType.spike, column: 52, row: 0),
    LevelObject(type: LevelObjectType.spike, column: 53.1, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 56, row: 1.2, columns: 5, rows: .5),

    LevelObject(type: LevelObjectType.jumpRing, column: 62, row: 4),
    LevelObject(type: LevelObjectType.platform, column: 65, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.platform, column: 67.5, row: 0, columns: 1, rows: 3),
    LevelObject(type: LevelObjectType.diamond, column: 69, row: 5),
    LevelObject(type: LevelObjectType.spike, column: 74, row: 0),
    LevelObject(type: LevelObjectType.jumpPad, column: 78, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 82, row: 2, columns: 4, rows: .5),

    LevelObject(type: LevelObjectType.speedPortal, column: 88, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 91, row: 1.5, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 97, row: 0),
    LevelObject(type: LevelObjectType.jumpRing, column: 101, row: 4),
    LevelObject(type: LevelObjectType.platform, column: 104, row: 2, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 106.5, row: 5),
    LevelObject(type: LevelObjectType.spike, column: 113, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 116, row: 0, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 122, row: 0),
    LevelObject(type: LevelObjectType.diamond, column: 126, row: 4),
    LevelObject(type: LevelObjectType.platform, column: 130, row: 1.5, columns: 4, rows: .5),
  ],
);
