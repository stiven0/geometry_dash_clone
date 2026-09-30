import 'package:geometry_dash/core/constants/levels/level_object.dart';
import './level.dart';

final level42 = Level(
  endColumn: 151,
  objects: [
    // Opening: floating island hops
    LevelObject(type: LevelObjectType.platform, column: 12, row: 2, columns: 2.5, rows: .5),
    LevelObject(type: LevelObjectType.platform, column: 17, row: 1.5, columns: 2.5, rows: .5),
    LevelObject(type: LevelObjectType.platform, column: 22, row: 2.2, columns: 2.5, rows: .5),
    LevelObject(type: LevelObjectType.jumpRing, column: 26, row: 3.5),
    LevelObject(type: LevelObjectType.spike, column: 30, row: 0),
    LevelObject(type: LevelObjectType.diamond, column: 24, row: 4),

    LevelObject(type: LevelObjectType.jumpPad, column: 34, row: 0),
    LevelObject(type: LevelObjectType.shield, column: 36.5, row: 2.4),
    LevelObject(type: LevelObjectType.platform, column: 39, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 45, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 48, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.spike, column: 49.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 51, row: 1.5, columns: 4.5, rows: .5),

    LevelObject(type: LevelObjectType.speedPortal, column: 57, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 60, row: 1.8, columns: 3, rows: .5),
    LevelObject(type: LevelObjectType.platform, column: 65, row: 2.2, columns: 3, rows: .5),
    LevelObject(type: LevelObjectType.jumpRing, column: 70, row: 4),
    LevelObject(type: LevelObjectType.diamond, column: 72, row: 5),
    LevelObject(type: LevelObjectType.spike, column: 78, row: 0),
    LevelObject(type: LevelObjectType.jumpPad, column: 82, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 86, row: 1.2, columns: 5, rows: .5),

    LevelObject(type: LevelObjectType.spike, column: 92, row: 0),
    LevelObject(type: LevelObjectType.spike, column: 93.1, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 96, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.speedPortal, column: 102, row: 0),
    LevelObject(type: LevelObjectType.jumpRing, column: 106, row: 4),
    LevelObject(type: LevelObjectType.platform, column: 109, row: 1.5, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 111.5, row: 5),
    LevelObject(type: LevelObjectType.spike, column: 118, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 121, row: 0, columns: 1, rows: 3),
    LevelObject(type: LevelObjectType.platform, column: 124, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.jumpRing, column: 130, row: 4),
    LevelObject(type: LevelObjectType.spike, column: 135, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 138, row: 0, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 142, row: 4),
    LevelObject(type: LevelObjectType.platform, column: 146, row: 1.5, columns: 4, rows: .5),
  ],
);
