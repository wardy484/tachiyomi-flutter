import 'package:collection/collection.dart';
import 'package:fluttiyomi/favourites/applications/favourites_updates_service.dart';
import 'package:fluttiyomi/favourites/data/favourite.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favourite_updates_controller.g.dart';
part 'favourite_updates_controller.freezed.dart';

@riverpod
class FavouriteUpdatesController extends _$FavouriteUpdatesController {
  @override
  FutureOr<void> build(Favourite favourite) {
    return ref
        .read(favouritesUpdateServiceProvider)
        .getLatestChapters(favourite);
  }
}

@riverpod
class FavouriteUpdateQueueController extends _$FavouriteUpdateQueueController {
  @override
  Queue build() => Queue(maxItems: 0, items: []);

  // TODO: For all that is holy get this off the main thread
  void addManyToQueue(List<Favourite> favourites) {
    for (var favourite in favourites) {
      addToQueue(favourite);
    }
  }

  Future addToQueue(Favourite favourite) {
    final queuedItem = state.items.firstWhereOrNull(
      (item) => item.favouriteId == favourite.id,
    );

    if (queuedItem != null) {
      return queuedItem.future;
    }

    final future =
        ref.read(favouriteUpdatesControllerProvider(favourite).future);

    future.then((value) {
      state = state.copyWith(
        items: state.items
            .where((item) => item.favouriteId != favourite.id)
            .toList(),
      );

      if (state.items.isEmpty) {
        state = state.copyWith(maxItems: 0);
      }
    });

    final updatedItems = [
      ...state.items,
      QueuedItem(favouriteId: favourite.id, future: future),
    ];

    state = state.copyWith(
      maxItems: state.maxItems + 1,
      items: updatedItems,
    );

    return future;
  }
}

@freezed
class Queue with _$Queue {
  factory Queue({
    required int maxItems,
    required List<QueuedItem> items,
  }) = _Queue;
}

class QueuedItem {
  final String favouriteId;
  final Future future;

  QueuedItem({
    required this.favouriteId,
    required this.future,
  });
}
