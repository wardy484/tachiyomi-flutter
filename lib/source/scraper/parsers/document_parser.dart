import 'package:fluttiyomi/source/scraper/schemas/field_schema.dart';
import 'package:fluttiyomi/source/scraper/schemas/page_schema.dart';
import 'package:html/dom.dart';

class DocumentParser {
  Map<String, dynamic> parsePage(PageSchema schema, Document document) {
    final rootNode = schema.selector != null
        ? document.querySelector(schema.selector!)
        : document.documentElement;

    if (rootNode == null) {
      throw Exception("Root node not found when parsing $PageSchema");
    }

    final Map<String, dynamic> values = {};

    for (final field in schema.items) {
      if (field.list) {
        values[field.name] = _parseFieldList(rootNode, field);
      } else {
        final element = field.selector != null
            ? rootNode.querySelector(field.selector!)
            : rootNode;

        values[field.name] = _parseField(element, field);
      }
    }

    return values;
  }

  List<T> _parseFieldList<T>(dynamic rootNode, FieldSchema field) {
    final List<T> values = [];

    final nodes = field.selector != null
        ? rootNode.querySelectorAll(field.selector!)
        : rootNode;

    for (int i = 0; i < nodes.length; i++) {
      values.add(_parseField(nodes[i], field));
    }

    return values;
  }

  dynamic _parseField(Element? element, FieldSchema field) {
    if (element == null) {
      return field.defaultValue;
    }

    if (field.selector == null &&
        field.items == null &&
        field.attribute == null &&
        field.list == false) {
      return field.defaultValue;
    }

    dynamic value;

    switch (field.attribute) {
      case "text":
        value = element.text.trim();
        break;
      case null:
        value = element;
        break;
      default:
        value = element.attributes[field.attribute];
    }

    if (field.items != null && value is Element) {
      final Map<String, dynamic> data = {};

      for (FieldSchema item in field.items!) {
        final element =
            item.selector != null ? value.querySelector(item.selector!) : value;

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
