import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:visibility_detector/visibility_detector.dart';

part 'reader_progress_state.dart';
part 'reader_progress_cubit.freezed.dart';

// ignore: constant_identifier_names
const VISIBILITY_THRESHOLD = 70;

class ReaderProgressCubit extends Cubit<ReaderProgressState> {
  ReaderProgressCubit() : super(const ReaderProgressState.initial());

  void moveProgress(String progress) {
    emit(const ReaderProgressState.initial());
    emit(ReaderProgressState.progressed(progress));
  }

  void moveProgressForVisibilityInfo(
    VisibilityInfo visibilityInfo,
    int maxPages,
    bool reversed,
  ) {
    var visiblePercentage = visibilityInfo.visibleFraction * 100;

    if (visiblePercentage > VISIBILITY_THRESHOLD) {
      final indexMatcher = RegExp(r'[0-9]+');
      String progress = indexMatcher
              .firstMatch(
                visibilityInfo.key.toString(),
              )!
              .group(0) ??
          "";

      int pageNumber = int.parse(progress);

      if (reversed) {
        pageNumber = maxPages - (pageNumber - 1);
      }

      moveProgress(pageNumber.toString());
    }
  }
}
