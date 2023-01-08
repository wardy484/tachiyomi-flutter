import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttiyomi/javascript/scraper/parsers/document_parser.dart';
import 'package:fluttiyomi/javascript/scraper/parsers/json_parser.dart';
import 'package:fluttiyomi/javascript/scraper/result.dart';
import 'package:fluttiyomi/javascript/scraper/schema.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart' show parse;

class Scraper {
  bool parseInIsolate;
  final _client = Dio();
  final _jsonParser = JsonParser();
  final _documentParser = DocumentParser();

  Scraper({this.parseInIsolate = false});

  void setParseInIsolate(bool value) {
    parseInIsolate = value;
  }

  Future<Map<String, dynamic>> scrape(
    PageSchema schema, {
    Map<String, String>? params,
    Map<String, String>? body,
    Map<String, String>? query,
  }) async {
    final data = await _makeRequest(
      schema.request,
      args: params,
      data: body,
      query: query,
    );

    return data.when(
      json: (json) {
        if (parseInIsolate) {
          return compute(_parseMap, {
            'schema': schema.toJson(),
            'json': json,
          });
        } else {
          return _jsonParser.parseMap(schema, json);
        }
      },
      html: (html) {
        if (parseInIsolate) {
          return compute(parseDocument, {
            'schema': schema.toJson(),
            'html': html.outerHtml,
          });
        } else {
          return _documentParser.parsePage(schema, html);
        }
      },
    );
  }

  Future<Result> _makeRequest(
    RequestSchema request, {
    Map<String, String>? args,
    Map<String, String>? data,
    Map<String, String>? query,
  }) async {
    final url = request.buildUrl(args: args);

    final response = await _client.request(
      url,
      options: Options(
        method: request.method,
        headers: request.headers,
      ),
      data: data,
      queryParameters: query,
    );

    if (response.data is String) {
      final page = parse(response.data);
      return Result.html(page);
    } else if (response.data is Map) {
      return Result.json(response.data);
    } else {
      throw Exception("Invalid response type");
    }
  }
}

Map<String, dynamic> parseDocument(Map<String, dynamic> args) {
  final PageSchema schema = PageSchema.fromJson(args['schema']);
  final Document document = parse(args['html']);

  return DocumentParser().parsePage(schema, document);
}

Map<String, dynamic> _parseMap(Map<String, dynamic> args) {
  final PageSchema schema = PageSchema.fromJson(args['schema']);
  final Map<String, dynamic> json = args['json'];

  return JsonParser().parseMap(schema, json);
}
