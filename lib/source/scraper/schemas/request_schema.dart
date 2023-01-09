import 'package:yaml/yaml.dart';

class RequestSchema {
  final String url;
  final String? method;
  final bool paged;
  final Map<String, dynamic>? headers;
  final Map<String, dynamic>? body;
  final Map<String, dynamic>? params;

  RequestSchema(
    this.url,
    this.method,
    this.headers,
    this.body,
    this.params,
    this.paged,
  );

  factory RequestSchema.fromYaml(YamlMap yaml) {
    final headers = yaml['headers'] != null
        ? Map<String, dynamic>.from(yaml['headers'])
        : null;

    final body =
        yaml['body'] != null ? Map<String, dynamic>.from(yaml['body']) : null;

    final params = yaml['params'] != null
        ? Map<String, dynamic>.from(yaml['params'])
        : null;

    return RequestSchema(
      yaml['url'],
      yaml['method'],
      headers,
      body,
      params,
      yaml['paged'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'method': method,
      'headers': headers,
      'body': body,
      'params': params,
      'paged': paged,
    };
  }

  factory RequestSchema.fromJson(Map<String, dynamic> json) {
    return RequestSchema(
      json['url'],
      json['method'],
      json['headers'],
      json['body'],
      json['params'],
      json['paged'] ?? false,
    );
  }

  String buildUrl({Map<String, dynamic>? args}) {
    String url = this.url;

    if (args == null) {
      return url;
    }

    for (final arg in args.entries) {
      url = url.replaceAll("{{ ${arg.key} }}", arg.value.toString());
      url = url.replaceAll("{{${arg.key}}}", arg.value.toString());
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

  Map<String, dynamic> buildQuery({Map<String, dynamic> args = const {}}) {
    if (body == null) {
      return {};
    }

    final Map<String, dynamic> builtBody = {};

    for (final entry in body!.entries) {
      dynamic value = entry.value;

      for (final arg in args.entries) {
        if (value is String) {
          value = value.replaceAll("{{ ${arg.key} }}", arg.value.toString());
          value = value.replaceAll("{{${arg.key}}}", arg.value.toString());
        }
      }

      builtBody[entry.key] = value;
    }

    return builtBody;
  }
}
