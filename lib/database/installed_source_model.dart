import 'dart:convert';

import 'package:fluttiyomi/source/schema/source_schema.dart';
import 'package:fluttiyomi/source/source.dart';
import 'package:isar/isar.dart';

part 'installed_source_model.g.dart';

@Collection()
class InstalledSource {
  Id? id;

  late String name;

  late String sourceId;

  late String iconPath;

  late String rawSchema;

  @ignore
  SourceSchema get schema => SourceSchema.fromJson(jsonDecode(rawSchema));

  @ignore
  Source get source => Source.fromSchema(schema);
}
