import 'package:fluttiyomi/javascript/scraper/transformers/transformer.dart';
import 'package:yaml/yaml.dart';

class PrefixValueTransformer extends Transformer {
  final String prefix;

  PrefixValueTransformer(this.prefix) : super('prefixValue', null);

  factory PrefixValueTransformer.fromYaml(YamlMap yaml) {
    return PrefixValueTransformer(
      yaml['prefix'] ?? "",
    );
  }

  @override
  dynamic transform(dynamic value, dynamic defaultValue) {
    if (value is! String) {
      return defaultValue;
    }

    return prefix + value;
  }

  factory PrefixValueTransformer.fromJson(Map<String, dynamic> json) {
    return PrefixValueTransformer(
      json['prefix'] ?? "",
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'prefix': prefix,
    };
  }
}
