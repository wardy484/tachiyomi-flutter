import 'package:fluttiyomi/database/favourite.dart';
import 'package:fluttiyomi/database/settings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = _Initial;
  const factory SettingsState.loaded(Setting settings) = _Loaded;
}
