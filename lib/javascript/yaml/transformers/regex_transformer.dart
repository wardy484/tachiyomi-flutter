import 'package:fluttiyomi/javascript/yaml/transformers/transformer.dart';
import 'package:yaml/yaml.dart';

class RegexTransformer extends Transformer {
  final String pattern;
  final int index;

  RegexTransformer(this.pattern, this.index) : super('regex', null);

  factory RegexTransformer.fromYaml(YamlMap yaml) {
    return RegexTransformer(
      yaml['pattern'],
      yaml['index'],
    );
  }

  @override
  dynamic transform(dynamic value, dynamic defaultValue) {
    final matches = RegExp(pattern).allMatches(value);
    if (matches.isNotEmpty) {
      return matches.elementAt(0).group(index);
    }

    return defaultValue;
  }
}
