import 'package:freezed_annotation/freezed_annotation.dart';

part 'reader_load_state.freezed.dart';

@freezed
class ReaderLoadState with _$ReaderLoadState {
  const factory ReaderLoadState.loaded() = Loaded;
  const factory ReaderLoadState.loading() = Loading;
  const factory ReaderLoadState.error({String? message}) = Error;
}
