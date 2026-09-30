import 'package:geometry_dash/core/constants/levels/level_object.dart';
import './level.dart';

final level28 = Level(
  endColumn: 142,
  objects: [
    // Opening: spike then early portal
    LevelObject(type: LevelObjectType.spike, column: 12, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 15, row: 1.2, columns: 3, rows: .5),
    LevelObject(type: LevelObjectType.speedPortal, column: 20, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 23, row: 0, columns: 1, rows: 2),
    LevelObject(type: LevelObjectType.spike, column: 24.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 26, row: 1.5, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 28, row: 4),

    // Mid: floating islands
    LevelObject(type: LevelObjectType.jumpRing, column: 33, row: 3),
    LevelObject(type: LevelObjectType.platform, column: 36, row: 2.2, columns: 2.5, rows: .5),
    LevelObject(type: LevelObjectType.shield, column: 39, row: 3.2),
    LevelObject(type: LevelObjectType.platform, column: 42, row: 1.8, columns: 3, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 47, row: 0),
    LevelObject(type: LevelObjectType.jumpPad, column: 51, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 55, row: 2, columns: 4, rows: .5),

    LevelObject(type: LevelObjectType.diamond, column: 57, row: 5),
    LevelObject(type: LevelObjectType.spike, column: 63, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 66, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.spike, column: 67.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 69, row: 1.5, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.jumpRing, column: 75, row: 4),
    LevelObject(type: LevelObjectType.spike, column: 79, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 82, row: 1.2, columns: 5, rows: .5),

    LevelObject(type: LevelObjectType.speedPortal, column: 89, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 92, row: 0, columns: 1, rows: 3),
    LevelObject(type: LevelObjectType.spike, column: 93.2, row: 0),
    LevelObject(type: LevelObjectType.jumpPad, column: 97, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 101, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 103, row: 5),
    LevelObject(type: LevelObjectType.jumpRing, column: 109, row: 4),
    LevelObject(type: LevelObjectType.spike, column: 114, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 117, row: 1.5, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 123, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 126, row: 0, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 130, row: 4),
    LevelObject(type: LevelObjectType.platform, column: 134, row: 1.5, columns: 4, rows: .5),
  ],
);
