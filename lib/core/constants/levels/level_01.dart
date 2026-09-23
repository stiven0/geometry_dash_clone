import 'package:geometry_dash/core/constants/levels/level_object.dart';
import './level.dart';

final level1 = Level(
  endColumn: 55,
  objects: [

    LevelObject(
      type: LevelObjectType.shield,
      column: 10,
      row: 2,
    ),

    LevelObject(
      type: LevelObjectType.platform,
      column: 12,
      row: 0,
      columns: 1,
      rows: 1,
    ),

    LevelObject(
      type: LevelObjectType.spike,
      column: 13.4,
      row: 0,
    ),

    LevelObject(
      type: LevelObjectType.platform,
      column: 14.5,
      row: 0,
      columns: 1,
      rows: 1.5,
    ),

    LevelObject(
      type: LevelObjectType.spike,
      column: 15.9,
      row: 0,
    ),

    LevelObject(
      type: LevelObjectType.platform,
      column: 17,
      row: 0,
      columns: 1,
      rows: 2,
    ),

    LevelObject(
      type: LevelObjectType.platform,
      column: 19.5,
      row: 0,
      columns: 1,
      rows: 2.5,
    ),

    //------------------------------------------
    // Primer cambio de ritmo
    //------------------------------------------

    LevelObject(
      type: LevelObjectType.jumpPad,
      column: 24,
      row: 0,
    ),

    LevelObject(
      type: LevelObjectType.platform,
      column: 28,
      row: 2,
      columns: 3.5,
      rows: .5,
    ),

    LevelObject(
      type: LevelObjectType.spike,
      column: 32,
      row: 0,
    ),

    LevelObject(
      type: LevelObjectType.platform,
      column: 36,
      row: 1.5,
      columns: 3.5,
      rows: .5,
    ),

    LevelObject(
      type: LevelObjectType.jumpRing,
      column: 40,
      row: 3,
    ),
    
    LevelObject(
      type: LevelObjectType.platform,
      column: 44,
      row: 1.2,
      columns: 4.5,
      rows: .5,
    ),

    LevelObject(
      type: LevelObjectType.diamond,
      column: 47,
      row: 4,
    ),

    LevelObject(
      type: LevelObjectType.spike,
      column: 51,
      row: 0,
    ),
  ],
);