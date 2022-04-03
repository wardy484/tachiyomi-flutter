import 'package:fluttiyomi/home/home_state.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier(
    sourceClient: ref.watch(sourceClientProvider),
  );
});

class HomeNotifier extends StateNotifier<HomeState> {
  SourceClient sourceClient;

  HomeNotifier({
    required this.sourceClient,
  }) : super(const HomeState.initial());

  Future<void> load() async {
    var sections = await sourceClient.getHomeSections();

    state = HomeState.loaded(sections);
  }
}
