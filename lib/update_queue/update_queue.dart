import 'package:fluttiyomi/update_queue/update_queue_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final updateQueueProvider =
    StateNotifierProvider<UpdateQueueNotifier, UpdateQueueState>((ref) {
  return UpdateQueueNotifier();
});

class UpdateQueueNotifier extends StateNotifier<UpdateQueueState> {
  final List<Function()> _onCompleteHandlers = [];

  UpdateQueueNotifier() : super(const UpdateQueueState.updated([]));

  QueuedItem addToQueue(
    String key,
    Future Function() action,
  ) {
    QueuedItem? item = _getQueuedItem(key);

    if (item is QueuedItem) {
      debug("Did not remove $key,");
      return item;
    }

    item = QueuedItem(name: key, future: action());
    item.future.whenComplete(() {
      removeFromQueue(key);
    });

    state = UpdateQueueState.updating([
      ...state.queue,
      item,
    ]);

    debug("Added $key,");

    return item;
  }

  void removeFromQueue(String key) {
    if (_queueContains(key)) {
      final queue = [...state.queue];
      queue.removeWhere((e) => e.name == key);

      if (queue.isEmpty) {
        state = const UpdateQueueState.updated([]);

        for (var handler in _onCompleteHandlers) {
          handler();
        }

        _onCompleteHandlers.clear();
      } else {
        state = UpdateQueueState.updating(queue);
      }

      debug("Removed $key,");
    } else {
      debug("Did not remove $key,");
    }
  }

  void setOnComplete(Function() onComplete) {
    _onCompleteHandlers.add(onComplete);
  }

  List<String> get queuedUpdates {
    return state.queue.map((e) => e.name).toList();
  }

  void debug(String action) {
    print("$action ${queuedUpdates.join(", ")}");
  }

  bool _queueContains(String key) {
    return state.queue.where((QueuedItem item) {
      return item.name == key;
    }).isNotEmpty;
  }

  QueuedItem? _getQueuedItem(String key) {
    var results = state.queue.where((QueuedItem item) {
      return item.name == key;
    });

    if (results.isNotEmpty) {
      return results.first;
    }

    return null;
  }
}

class QueuedItem {
  final String name;
  final Future future;

  QueuedItem({
    required this.name,
    required this.future,
  });
}
