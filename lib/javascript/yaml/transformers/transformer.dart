import 'package:fluttiyomi/javascript/yaml/transformers/cast_transformer.dart';
import 'package:fluttiyomi/javascript/yaml/transformers/parse_date_transformer.dart';
import 'package:fluttiyomi/javascript/yaml/transformers/prefix_transformer.dart';
import 'package:fluttiyomi/javascript/yaml/transformers/regex_transformer.dart';
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
}
