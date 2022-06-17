import 'package:fluttiyomi/update_queue/update_queue.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_queue_state.freezed.dart';

@freezed
class UpdateQueueState with _$UpdateQueueState {
  const factory UpdateQueueState.updating(
    List<QueuedItem> queue,
    int total,
  ) = _updating;
  const factory UpdateQueueState.updated(
    List<QueuedItem> queue,
    int total,
  ) = _updated;
}
