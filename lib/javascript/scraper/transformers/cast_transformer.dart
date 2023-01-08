import 'package:fluttiyomi/javascript/scraper/transformers/transformer.dart';
import 'package:yaml/yaml.dart';

class CastTransformer extends Transformer {
  final String to;

  CastTransformer(this.to) : super('cast', null);

  factory CastTransformer.fromYaml(YamlMap yaml) {
    return CastTransformer(
      yaml['to'],
    );
  }

  @override
  dynamic transform(dynamic value, dynamic defaultValue) {
    switch (to) {
      case 'number':
        if (value is num) return value;
        return num.tryParse(value) ?? defaultValue;
      case 'boolean':
        return value == 'true' ? true : false;
      case 'string':
        return value.toString();
      default:
        throw UnimplementedError();
    }
  }

  factory CastTransformer.fromJson(Map<String, dynamic> json) {
    return CastTransformer(
      json['to'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'to': to,
    };
  }
}
