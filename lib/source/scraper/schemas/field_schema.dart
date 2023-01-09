import 'package:fluttiyomi/source/scraper/transformers/transformer.dart';
import 'package:yaml/yaml.dart';

class FieldSchema<T> {
  final String name;
  final String? selector;
  final bool list;
  final String? attribute;
  final T defaultValue;
  final List<Transformer> transformers;
  final List<FieldSchema>? items;

  FieldSchema(
    this.name,
    this.selector,
    this.list,
    this.attribute,
    this.defaultValue,
    this.transformers,
    this.items,
  );

  factory FieldSchema.fromYaml(YamlMap yaml) {
    final List<Transformer> transformers = yaml['transformers'] != null
        ? (yaml['transformers'])
            .map<Transformer>((t) => Transformer.fromYaml(t))
            .toList()
        : [];

    final List<FieldSchema>? fields = yaml['items'] != null
        ? (yaml['items'] as YamlList)
            .map<FieldSchema>((f) => FieldSchema.fromYaml(f))
            .toList()
        : null;

    return FieldSchema(
      yaml['name'],
      yaml['selector'],
      yaml['list'] ?? false,
      yaml['attribute'],
      yaml['default'],
      transformers,
      fields,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'selector': selector,
      'list': list,
      'attribute': attribute,
      'default': defaultValue,
      'transformers': transformers.map((t) => t.toJson()).toList(),
      'items': items?.map((f) => f.toJson()).toList(),
    };
  }

  factory FieldSchema.fromJson(Map<String, dynamic> json) {
    final List<Transformer> transformers = json['transformers'] != null
        ? (json['transformers'] as List)
            .map<Transformer>((t) => Transformer.fromJson(t))
            .toList()
        : [];

    final List<FieldSchema>? fields = json['items'] != null
        ? (json['items'] as List)
            .map<FieldSchema>((f) => FieldSchema.fromJson(f))
            .toList()
        : null;

    return FieldSchema(
      json['name'],
      json['selector'],
      json['list'] ?? false,
      json['attribute'],
      json['default'],
      transformers,
      fields,
    );
  }
}
