import 'package:fluttiyomi/javascript/scraper/schema.dart';

class JsonParser {
  Map<String, dynamic> parseMap(PageSchema schema, Map<String, dynamic> json) {
    final Map<String, dynamic> values = {};

    for (final field in schema.items) {
      if (field.list) {
        values[field.name] = _parseFieldList(json, field);
      } else {
        values[field.name] = _parseField(json, field);
      }
    }

    return values;
  }

  List<T> _parseFieldList<T>(Map<String, dynamic> json, FieldSchema field) {
    final List<T> values = [];

    final nodes = json[field.selector!];

    if (nodes == null) return [];

    for (int i = 0; i < nodes.length; i++) {
      values.add(_parseField(nodes[i], field));
    }

    return values;
  }

  dynamic _parseField(dynamic json, FieldSchema field) {
    if (field.selector == null &&
        field.items == null &&
        field.attribute == null &&
        field.list == false) {
      return field.defaultValue;
    }

    dynamic value;

    switch (field.attribute) {
      case "text":
        value = json[field.selector!];
        break;
      case null:
        value = json;
        break;
      default:
        value = json[field.attribute];
    }

    if (field.items != null && value is Map<String, dynamic>) {
      final Map<String, dynamic> data = {};

      for (FieldSchema item in field.items!) {
        final element = item.selector != null ? value[item.selector!] : value;

        if (element == null) {
          data[item.name] = item.defaultValue;
        } else if (item.list && item.items != null) {
          // Passing down value instead of element for lists we can grab an
          // element from the list
          data[item.name] = _parseFieldList(value, item);
        } else {
          data[item.name] = _parseField(element, item);
        }
      }

      value = data;
    }

    if (value != null) {
      dynamic transformedValue = value;

      for (final transformer in field.transformers) {
        transformedValue = transformer.transform(
          transformedValue,
          field.defaultValue,
        );
      }

      return transformedValue;
    }

    return field.defaultValue;
  }
}
