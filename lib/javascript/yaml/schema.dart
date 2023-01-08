import 'package:fluttiyomi/javascript/yaml/transformers/transformer.dart';
import 'package:yaml/yaml.dart';

class SourceSchema {
  final PageSchema chapters;
  final PageSchema chapterDetails;
  final PageSchema mangaDetails;
  final PageSchema home;

  SourceSchema(
    this.chapters,
    this.chapterDetails,
    this.mangaDetails,
    this.home,
  );

  factory SourceSchema.fromYaml(YamlMap yaml) {
    return SourceSchema(
      PageSchema.fromYaml(yaml['chapters_schema']),
      PageSchema.fromYaml(yaml['chapter_details_schema']),
      PageSchema.fromYaml(yaml['manga_details_schema']),
      PageSchema.fromYaml(yaml['home_schema']),
    );
  }
}

class PageSchema {
  final RequestSchema request;
  final String? selector;
  final bool? list;
  final List<FieldSchema> items;

  PageSchema(
    this.request,
    this.selector,
    this.list,
    this.items,
  );

  factory PageSchema.fromYaml(YamlMap yaml) {
    return PageSchema(
      RequestSchema.fromYaml(yaml['request']),
      yaml['selector'],
      yaml['list'] ?? false,
      (yaml['items'] as YamlList).map((e) => FieldSchema.fromYaml(e)).toList(),
    );
  }
}

class RequestSchema {
  final String url;
  final String? method;
  final Map<String, String>? headers;
  final Map<String, String>? params;
  final Map<String, String>? data;

  RequestSchema(
    this.url,
    this.method,
    this.headers,
    this.params,
    this.data,
  );

  factory RequestSchema.fromYaml(YamlMap yaml) {
    return RequestSchema(
      yaml['url'],
      yaml['method'],
      yaml['headers'],
      yaml['params'],
      yaml['data'],
    );
  }

  String buildUrl({Map<String, String>? args}) {
    String url = this.url;

    if (args == null) {
      return url;
    }

    for (final arg in args.entries) {
      url = url.replaceAll("{{ ${arg.key} }}", arg.value);
      url = url.replaceAll("{{${arg.key}}}", arg.value);
    }

    return url;
  }
}

class ListSchema {
  final String selector;
  final FieldSchema items;

  ListSchema(
    this.selector,
    this.items,
  );

  factory ListSchema.fromYaml(YamlMap yaml) {
    return ListSchema(
      yaml['selector'],
      FieldSchema.fromYaml(yaml['item']),
    );
  }
}

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
}
