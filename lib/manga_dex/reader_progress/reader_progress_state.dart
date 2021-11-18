part of 'reader_progress_cubit.dart';

@freezed
class ReaderProgressState with _$ReaderProgressState {
  const factory ReaderProgressState.initial() = _Initial;
  const factory ReaderProgressState.progressed(String progress) = _Progressed;
}
