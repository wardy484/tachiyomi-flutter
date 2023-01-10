import 'package:fluttiyomi/source/scraper/schemas/field_schema.dart';
import 'package:yaml/yaml.dart';

class ListSchema {
  final String selector;
  final FieldSchema items;

  ListSchema(
    this.selector,
    this.items,
  );

  factory ListSchema.fromYaml(YamlMap yaml) {
    return ListSchema(
      yaml['selector'],
      FieldSchema.fromYaml(yaml['item']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'selector': selector,
      'item': items.toJson(),
    };
  }

  factory ListSchema.fromJson(Map<String, dynamic> json) {
    return ListSchema(
      json['selector'],
      FieldSchema.fromJson(json['item']),
    );
  }
}
