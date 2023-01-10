import 'package:fluttiyomi/source/scraper/transformers/transformer.dart';
import 'package:intl/intl.dart';
import 'package:yaml/yaml.dart';

class ParseDateTransformer extends Transformer {
  final String format;

  ParseDateTransformer(this.format) : super('parseDate', null);

  factory ParseDateTransformer.fromYaml(YamlMap yaml) {
    return ParseDateTransformer(
      yaml['format'],
    );
  }

  @override
  dynamic transform(dynamic value, dynamic defaultValue) {
    DateTime? date;

    switch (format) {
      case 'human':
        date = _parseHumanReadableDate(value);
        break;
      default:
        throw UnimplementedError();
    }

    // TODO: Get rid of this once we are no longer dependent on
    // web based source
    String jsFormat = "EEE MMM d yyyy HH:mm:ss";
    DateFormat formatter = DateFormat(jsFormat);

    if (date == null) {
      return defaultValue;
    }

    return formatter.format(date);
  }

  DateTime? _parseHumanReadableDate(dynamic value) {
    value = value.toUpperCase();
    DateTime time;
    final number =
        int.tryParse((RegExp(r'\d*').firstMatch(value)?.group(0) ?? '')[0]);

    if (number == null) {
      return null;
    }

    if (value.contains('LESS THAN AN HOUR') || value.contains('JUST NOW')) {
      time = DateTime.now();
    } else if (value.contains('YEAR') || value.contains('YEARS')) {
      time =
          DateTime.now().subtract(Duration(milliseconds: number * 31556952000));
    } else if (value.contains('MONTH') || value.contains('MONTHS')) {
      time =
          DateTime.now().subtract(Duration(milliseconds: number * 2592000000));
    } else if (value.contains('WEEK') || value.contains('WEEKS')) {
      time =
          DateTime.now().subtract(Duration(milliseconds: number * 604800000));
    } else if (value.contains('YESTERDAY')) {
      time = DateTime.now().subtract(const Duration(days: 1));
    } else if (value.contains('DAY') || value.contains('DAYS')) {
      time = DateTime.now().subtract(Duration(days: number));
    } else if (value.contains('HOUR') || value.contains('HOURS')) {
      time = DateTime.now().subtract(Duration(hours: number));
    } else if (value.contains('MINUTE') || value.contains('MINUTES')) {
      time = DateTime.now().subtract(Duration(minutes: number));
    } else if (value.contains('SECOND') || value.contains('SECONDS')) {
      time = DateTime.now().subtract(Duration(seconds: number));
    } else {
      time = _tryParseDate(value);

      // time = DateFormat("d MMM y").parseLoose(value);
    }
    return time;
  }

  DateTime _tryParseDate(String value) {
    // List of date formats to try
    List<String> dateFormats = [
      "d MMM y", // 30 DEC 2022
      "d MMMM y", // 30 DECEMBER 2022
      "dd MMM y", // 30 DEC 2022
      "dd MMMM y", // 30 DECEMBER 2022
      "yyyy-MM-dd", // 2022-12-30
      "dd-MM-yyyy", // 30-12-2022
      "MM-dd-yyyy", // 12-30-2022
      "d/M/y", // 30/12/22
      "d/M/yy", // 30/12/22
      "d/M/yyyy", // 30/12/2022
    ];

    // Try each date format and return the first one that succeeds
    for (String format in dateFormats) {
      try {
        return DateFormat(format).parseLoose(value);
      } catch (e) {
        // Format is invalid, try the next one
      }
    }

    // If none of the formats were successful, throw a FormatException
    throw FormatException("Invalid date format: $value");
  }

  factory ParseDateTransformer.fromJson(Map<String, dynamic> json) {
    return ParseDateTransformer(
      json['format'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'format': format,
    };
  }
}
