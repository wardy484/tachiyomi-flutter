import 'package:isar/isar.dart';

part 'settings.g.dart';

enum SettingsType { global }

@Collection()
class Setting {
  Id? id;

  @Index()
  @enumerated
  late SettingsType type;

  int padding = 0;

  late DateTime lastUpdateCheck;
}
