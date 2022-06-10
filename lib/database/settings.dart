import 'package:isar/isar.dart';

part 'settings.g.dart';

enum SettingsType { global }

@Collection()
class Setting {
  @Id()
  int? id;

  @Index()
  late SettingsType type;

  int padding = 0;

  bool showFps = false;

  late DateTime lastUpdateCheck;
}
