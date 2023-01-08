import 'package:fluttiyomi/javascript/scraper/transformers/transformer.dart';
import 'package:yaml/yaml.dart';

class SourceSchema {
  final PageSchema chapters;
  final PageSchema chapterDetails;
  final PageSchema mangaDetails;
  final PageSchema home;
  final PageSchema search;

  SourceSchema(this.chapters, this.chapterDetails, this.mangaDetails, this.home,
      this.search);

  factory SourceSchema.fromYaml(YamlMap yaml) {
    return SourceSchema(
      PageSchema.fromYaml(yaml['chapters_schema']),
      PageSchema.fromYaml(yaml['chapter_details_schema']),
      PageSchema.fromYaml(yaml['manga_details_schema']),
      PageSchema.fromYaml(yaml['home_schema']),
      PageSchema.fromYaml(yaml['search_schema']),
    );
  }

  factory SourceSchema.fromJson(Map<String, dynamic> json) {
    return SourceSchema(
      PageSchema.fromJson(json['chapters_schema']),
      PageSchema.fromJson(json['chapter_details_schema']),
      PageSchema.fromJson(json['manga_details_schema']),
      PageSchema.fromJson(json['home_schema']),
      PageSchema.fromJson(json['search_schema']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chapters_schema': chapters.toJson(),
      'chapter_details_schema': chapterDetails.toJson(),
      'manga_details_schema': mangaDetails.toJson(),
      'home_schema': home.toJson(),
      'search_schema': search.toJson(),
    };
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
      (yaml['items'] as YamlList)
          .map((item) => FieldSchema.fromYaml(item))
          .toList(),
    );
  }

  factory PageSchema.fromJson(Map<String, dynamic> json) {
    return PageSchema(
      RequestSchema.fromJson(json['request']),
      json['selector'],
      json['list'] ?? false,
      (json['items'] as List)
          .map((item) => FieldSchema.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
      'selector': selector,
      'list': list,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }
}

class RequestSchema {
  final String url;
  final String? method;
  final Map<String, dynamic>? headers;
  final Map<String, String>? body;
  final Map<String, String>? params;

  RequestSchema(
    this.url,
    this.method,
    this.headers,
    this.body,
    this.params,
  );

  factory RequestSchema.fromYaml(YamlMap yaml) {
    final headers = yaml['headers'] != null
        ? Map<String, dynamic>.from(yaml['headers'])
        : null;

    final body =
        yaml['body'] != null ? Map<String, String>.from(yaml['body']) : null;

    final params = yaml['params'] != null
        ? Map<String, String>.from(yaml['params'])
        : null;

    return RequestSchema(
      yaml['url'],
      yaml['method'],
      headers,
      body,
      params,
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

  Map<String, String> buildBody(Map<String, String> args) {
    if (body == null) {
      return {};
    }

    final Map<String, String> builtBody = {};

    for (final entry in body!.entries) {
      String value = entry.value;

      for (final arg in args.entries) {
        value = value.replaceAll("{{ ${arg.key} }}", arg.value);
        value = value.replaceAll("{{${arg.key}}}", arg.value);
      }

      builtBody[entry.key] = value;
    }

    return builtBody;
  }

  Map<String, String> buildQuery(Map<String, String> args) {
    if (body == null) {
      return {};
    }

    final Map<String, String> builtBody = {};

    for (final entry in body!.entries) {
      String value = entry.value;

      for (final arg in args.entries) {
        value = value.replaceAll("{{ ${arg.key} }}", arg.value);
        value = value.replaceAll("{{${arg.key}}}", arg.value);
      }

      builtBody[entry.key] = value;
    }

    return builtBody;
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'method': method,
      'headers': headers,
      'body': body,
      'params': params,
    };
  }

  factory RequestSchema.fromJson(Map<String, dynamic> json) {
    return RequestSchema(
      json['url'],
      json['method'],
      json['headers'],
      json['body'],
      json['params'],
    );
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

  Map<String, dynamic> toJson() {
    return {
      'selector': selector,
      'item': items.toJson(),
    };
  }

  factory ListSchema.fromJson(Map<String, dynamic> json) {
    return ListSchema(
      json['selector'],
      FieldSchema.fromJson(json['item']),
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

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'selector': selector,
      'list': list,
      'attribute': attribute,
      'default': defaultValue,
      'transformers': transformers.map((t) => t.toJson()).toList(),
      'items': items?.map((f) => f.toJson()).toList(),
    };
  }

  factory FieldSchema.fromJson(Map<String, dynamic> json) {
    final List<Transformer> transformers = json['transformers'] != null
        ? (json['transformers'] as List)
            .map<Transformer>((t) => Transformer.fromJson(t))
            .toList()
        : [];

    final List<FieldSchema>? fields = json['items'] != null
        ? (json['items'] as List)
            .map<FieldSchema>((f) => FieldSchema.fromJson(f))
            .toList()
        : null;

    return FieldSchema(
      json['name'],
      json['selector'],
      json['list'] ?? false,
      json['attribute'],
      json['default'],
      transformers,
      fields,
    );
  }
}
