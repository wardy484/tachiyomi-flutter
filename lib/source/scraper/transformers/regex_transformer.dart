import 'package:fluttiyomi/source/scraper/transformers/transformer.dart';
import 'package:yaml/yaml.dart';

class RegexTransformer extends Transformer {
  final String pattern;
  final int index;

  RegexTransformer(this.pattern, this.index) : super('regex', null);

  @override
  dynamic transform(dynamic value, dynamic defaultValue) {
    final matches = RegExp(pattern).allMatches(value);
    if (matches.isNotEmpty) {
      return matches.elementAt(0).group(index);
    }

    return defaultValue;
  }

  factory RegexTransformer.fromYaml(YamlMap yaml) {
    return RegexTransformer(
      yaml['pattern'],
      yaml['index'],
    );
  }

  factory RegexTransformer.fromJson(Map<String, dynamic> json) {
    return RegexTransformer(
      json['pattern'],
      json['index'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'pattern': pattern,
      'index': index,
    };
  }
}
