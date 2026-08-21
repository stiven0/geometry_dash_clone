import 'level_object.dart';

class Level {

  final List<LevelObject> objects;
  final double endColumn;

  const Level({
    required this.objects,
    required this.endColumn,
  });

}