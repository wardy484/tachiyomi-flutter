import 'package:fluttiyomi/source/scraper/transformers/cast_transformer.dart';
import 'package:fluttiyomi/source/scraper/transformers/parse_date_transformer.dart';
import 'package:fluttiyomi/source/scraper/transformers/prefix_transformer.dart';
import 'package:fluttiyomi/source/scraper/transformers/regex_transformer.dart';
import 'package:yaml/yaml.dart';

import 'image_source_transformer.dart';

abstract class Transformer {
  final String type;
  final dynamic value;

  Transformer(this.type, this.value);

  factory Transformer.fromYaml(YamlMap yaml) {
    switch (yaml['type']) {
      case 'regex':
        return RegexTransformer.fromYaml(yaml);
      case 'cast':
        return CastTransformer.fromYaml(yaml);
      case 'parseDate':
        return ParseDateTransformer.fromYaml(yaml);
      case 'imageSource':
        return ImageSourceTransformer.fromYaml(yaml);
      case 'prefixValue':
        return PrefixValueTransformer.fromYaml(yaml);
      default:
        throw UnimplementedError();
    }
  }

  dynamic transform(dynamic value, dynamic defaultValue);

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'value': value,
    };
  }

  factory Transformer.fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'regex':
        return RegexTransformer.fromJson(json);
      case 'cast':
        return CastTransformer.fromJson(json);
      case 'parseDate':
        return ParseDateTransformer.fromJson(json);
      case 'imageSource':
        return ImageSourceTransformer.fromJson(json);
      case 'prefixValue':
        return PrefixValueTransformer.fromJson(json);
      default:
        throw UnimplementedError();
    }
  }
}
