import 'package:fluttiyomi/data/home_results/home_section.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loaded(List<HomeSection> homeSections) = _Loaded;
}
