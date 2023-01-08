import 'package:fluttiyomi/javascript/scraper/transformers/transformer.dart';
import 'package:html/dom.dart';
import 'package:yaml/yaml.dart';

class ImageSourceTransformer extends Transformer {
  ImageSourceTransformer() : super('imageSource', null);

  factory ImageSourceTransformer.fromYaml(YamlMap yaml) {
    return ImageSourceTransformer();
  }

  @override
  dynamic transform(dynamic value, dynamic defaultValue) {
    if (value is! Element) {
      return defaultValue;
    }

    String? image = '';
    String? src = value.attributes['src'];
    String? dataLazy = value.attributes['data-lazy-src'];
    String? srcset = value.attributes['srcset'];
    String? dataSRC = value.attributes['data-src'];
    String? dataSRCset = value.attributes['data-splide-lazy'];

    if (src != null && !src.startsWith('data')) {
      image = value.attributes['src'];
    } else if (dataLazy != null && !dataLazy.startsWith('data')) {
      image = value.attributes['data-lazy-src'];
    } else if (srcset != null && !srcset.startsWith('data')) {
      image = value.attributes['srcset']?.split(' ')[0] ?? '';
    } else if (dataSRC != null && !dataSRC.startsWith('data')) {
      image = value.attributes['data-src'];
    } else if (dataSRCset != null && !dataSRCset.startsWith('data')) {
      image = value.attributes['data-splide-lazy'];
    } else {
      image = null;
    }

    return Uri.encodeFull(Uri.decodeFull(image?.trim() ?? ''));
  }

  factory ImageSourceTransformer.fromJson(Map<String, dynamic> json) {
    return ImageSourceTransformer();
  }
}
