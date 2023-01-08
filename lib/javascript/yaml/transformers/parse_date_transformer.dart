import 'package:fluttiyomi/javascript/yaml/transformers/transformer.dart';
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
      final split = value.split('-');
      time = DateTime(
          int.parse(split[2]), int.parse(split[0]) - 1, int.parse(split[1]));
    }
    return time;
  }
}
