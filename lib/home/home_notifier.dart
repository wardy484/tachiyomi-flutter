import 'package:fluttiyomi/home/home_state.dart';
import 'package:fluttiyomi/source/source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier(
    source: ref.watch(sourceProvider),
  );
});

class HomeNotifier extends StateNotifier<HomeState> {
  Source source;

  HomeNotifier({
    required this.source,
  }) : super(const HomeState.initial());

  Future<void> load() async {
    var sections = await source.getHomeSections();

    state = HomeState.loaded(sections);
  }
}
