import 'package:geometry_dash/core/constants/levels/level_object.dart';
import './level.dart';

final level34 = Level(
  endColumn: 151,
  objects: [
    // Opening: ring first in the air
    LevelObject(type: LevelObjectType.jumpRing, column: 14, row: 3),
    LevelObject(type: LevelObjectType.platform, column: 17, row: 2, columns: 3.5, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 22, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 25, row: 0, columns: 1, rows: 2),
    LevelObject(type: LevelObjectType.diamond, column: 25.5, row: 4),
    LevelObject(type: LevelObjectType.spike, column: 26.5, row: 0),
    LevelObject(type: LevelObjectType.jumpPad, column: 30, row: 0),

    // Mid: speed then floating platforms
    LevelObject(type: LevelObjectType.speedPortal, column: 34, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 37, row: 1.8, columns: 3, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 41.5, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 44, row: 2.2, columns: 3.5, rows: .5),
    LevelObject(type: LevelObjectType.shield, column: 46, row: 3.5),
    LevelObject(type: LevelObjectType.jumpRing, column: 49, row: 4),
    LevelObject(type: LevelObjectType.platform, column: 52, row: 1.5, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 54.5, row: 5),

    LevelObject(type: LevelObjectType.spike, column: 60, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 63, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.spike, column: 64.2, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 66, row: 0, columns: 1, rows: 3),
    LevelObject(type: LevelObjectType.jumpPad, column: 70, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 74, row: 2, columns: 4, rows: .5),

    LevelObject(type: LevelObjectType.spike, column: 80, row: 0),
    LevelObject(type: LevelObjectType.spike, column: 81, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 84, row: 1.2, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.jumpRing, column: 90, row: 4),
    LevelObject(type: LevelObjectType.diamond, column: 92, row: 5),
    LevelObject(type: LevelObjectType.speedPortal, column: 97, row: 0),

    LevelObject(type: LevelObjectType.platform, column: 100, row: 1.5, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 106, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 109, row: 0, columns: 1, rows: 2.5),
    LevelObject(type: LevelObjectType.platform, column: 111.5, row: 0, columns: 1, rows: 3),
    LevelObject(type: LevelObjectType.jumpRing, column: 116, row: 4),
    LevelObject(type: LevelObjectType.platform, column: 119, row: 2, columns: 4.5, rows: .5),
    LevelObject(type: LevelObjectType.diamond, column: 121.5, row: 5),
    LevelObject(type: LevelObjectType.spike, column: 128, row: 0),
    LevelObject(type: LevelObjectType.platform, column: 131, row: 0, columns: 5, rows: .5),
    LevelObject(type: LevelObjectType.spike, column: 138, row: 0),
    LevelObject(type: LevelObjectType.diamond, column: 142, row: 4),
    LevelObject(type: LevelObjectType.platform, column: 146, row: 1.5, columns: 4, rows: .5),
  ],
);
