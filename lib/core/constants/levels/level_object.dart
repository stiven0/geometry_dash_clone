enum LevelObjectType {
  spike,
  platform,
  jumpPad,
  diamond,
  jumpRing,
  speedPortal,
  shield,
}

class LevelObject {

  final LevelObjectType type;

  /// Columna del objeto
  final double column;

  /// Fila del objeto
  final double row;

  /// Ancho en columnas
  final double columns;

  /// Alto en filas
  final double rows;

  const LevelObject({
    required this.type,
    required this.column,
    required this.row,
    this.columns = 1,
    this.rows = 1,
  });
}