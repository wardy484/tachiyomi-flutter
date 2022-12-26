import 'package:fullscreen/fullscreen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reader_appbar_controller.g.dart';

@riverpod
class ReaderAppbarController extends _$ReaderAppbarController {
  @override
  bool build() {
    return true;
  }

  void toggleVisibility() {
    if (state) {
      hideAppbar();
    } else {
      showAppbar();
    }
  }

  void hideAppbar() {
    state = false;
    FullScreen.enterFullScreen(FullScreenMode.LEANBACK);
  }

  void showAppbar() {
    state = true;
    FullScreen.exitFullScreen();
  }
}
