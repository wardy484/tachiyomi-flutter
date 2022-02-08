import 'package:freezed_annotation/freezed_annotation.dart';

part 'reader_state.freezed.dart';

@freezed
class ReaderState with _$ReaderState {
  const factory ReaderState.reading(
    String progress,
    bool appbarVisible,
  ) = _Reading;
}
