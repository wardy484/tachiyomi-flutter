import 'package:fluttiyomi/source/scraper/schemas/field_schema.dart';
import 'package:fluttiyomi/source/scraper/schemas/request_schema.dart';
import 'package:yaml/yaml.dart';

class PageSchema {
  final RequestSchema request;
  final String? selector;
  final bool? list;
  final List<FieldSchema> items;

  PageSchema(
    this.request,
    this.selector,
    this.list,
    this.items,
  );

  factory PageSchema.fromYaml(YamlMap yaml) {
    return PageSchema(
      RequestSchema.fromYaml(yaml['request']),
      yaml['selector'],
      yaml['list'] ?? false,
      (yaml['items'] as YamlList)
          .map((item) => FieldSchema.fromYaml(item))
          .toList(),
    );
  }

  factory PageSchema.fromJson(Map<String, dynamic> json) {
    return PageSchema(
      RequestSchema.fromJson(json['request']),
      json['selector'],
      json['list'] ?? false,
      (json['items'] as List)
          .map((item) => FieldSchema.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
      'selector': selector,
      'list': list,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }
}
