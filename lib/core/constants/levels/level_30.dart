import 'package:geometry_dash/core/constants/levels/level_object.dart';
import './level.dart';

final level30 = Level(
  endColumn: 140,
  objects: [
    // Opening: spikes first, then ring (no early diamond)
    LevelObject(type: LevelObjectType.spike, column: 12, row: 0),
    LevelObject(type: LevelObjectType.spike, column: 13.2, row: 0),
    LevelObject(type: LevelObjectType.jumpRing, column: 16, row: 3),
    LevelObject(type: LevelObjectType.platform, column: 20, row: 1.5, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.jumpPad, column: 25, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 29, row: 2, columns: 3.5, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 34, row: 0),

    // Mid: aerial rings stretch
    LevelObject(type: LevelObjectType.jumpRing, column: 38, row: 3.5),
    LevelObject(type: LevelObjectType.shield, column: 40, row: 2.2),
    LevelObject(type: LevelObjectType.platform, column: 42, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 44, row: 5),
    LevelObject(type: LevelObjectType.jumpRing, column: 48, row: 4),
    LevelObject(type: LevelObjectType.spike, column: 52, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 55, row: 1.2, columns: 5, rows: .5),

    LevelObject(type: LevelObjectType.speedPortal, column: 62, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 65, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.spike, column: 66.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 68, row: 1.5, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 74, row: 0),

    LevelObject(type: LevelObjectType.jumpPad, column: 78, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 82, row: 2, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 84.5, row: 5),
    LevelObject(type: LevelObjectType.spike, column: 90, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 93, row: 0, columns: 1, rows: 3),
    LevelObject(type: LevelObjectType.jumpRing, column: 97, row: 4),

    LevelObject(type: LevelObjectType.speedPortal, column: 102, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 105, row: 1.5, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 111, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 114, row: 2, columns: 4, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 116, row: 5),
    LevelObject(type: LevelObjectType.spike, column: 122, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 126, row: 0, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 132, row: 0),
    LevelObject(type: LevelObjectType.diamond, column: 136, row: 4),
  ],
);
