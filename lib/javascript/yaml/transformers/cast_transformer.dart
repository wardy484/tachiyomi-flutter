import 'package:fluttiyomi/javascript/yaml/transformers/transformer.dart';
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
        return num.tryParse(value) ?? defaultValue;
      case 'boolean':
        return value == 'true' ? true : false;
      case 'string':
        return value.toString();
      default:
        throw UnimplementedError();
    }
  }
}
