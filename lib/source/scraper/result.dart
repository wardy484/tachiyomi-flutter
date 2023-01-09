import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:html/dom.dart';

part 'result.freezed.dart';

@freezed
class Result with _$Result {
  const factory Result.html(Document html) = _Html;
  const factory Result.json(Map<String, dynamic> json) = _Json;
}
