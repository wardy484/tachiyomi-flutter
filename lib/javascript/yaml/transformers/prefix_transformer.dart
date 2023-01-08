import 'package:fluttiyomi/javascript/yaml/transformers/transformer.dart';
import 'package:yaml/yaml.dart';

class PrefixValueTransformer extends Transformer {
  final String prefix;

  PrefixValueTransformer(this.prefix) : super('imageSource', null);

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
}
