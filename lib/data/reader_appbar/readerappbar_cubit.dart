import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/services.dart';

part 'readerappbar_state.dart';
part 'readerappbar_cubit.freezed.dart';

class ReaderappbarCubit extends Cubit<ReaderappbarState> {
  ReaderappbarCubit() : super(const ReaderappbarState.visible());

  void toggleVisibility() {
    state.when(
      visible: () {
        hideAppbar();
      },
      hidden: () {
        showAppbar();
      },
    );
  }

  void hideAppbar() {
    emit(const ReaderappbarState.hidden());
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  void showAppbar() {
    emit(const ReaderappbarState.visible());
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }
}
