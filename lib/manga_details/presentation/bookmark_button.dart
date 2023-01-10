import 'package:flutter/material.dart';
import 'package:fluttiyomi/manga_details/presentation/bookmark_button_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookmarkButton extends ConsumerWidget {
  final String mangaId;

  const BookmarkButton({
    Key? key,
    required this.mangaId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(bookmarkButtonControllerProvider(mangaId));

    return Expanded(
      child: controller.maybeWhen(
        data: (favourite) => OutlinedButton.icon(
          onPressed: () async {
            ref
                .read(bookmarkButtonControllerProvider(mangaId).notifier)
                .toggleFavourite(mangaId);
          },
          label: favourite == null
              ? const Text('Save to library')
              : const Text('In library'),
          icon: Icon(
            favourite == null ? Icons.bookmark_add_outlined : Icons.bookmark,
          ),
        ),
        orElse: () => const OutlinedButton(
          onPressed: null,
          child: SizedBox(
            height: 18,
            width: 18,
            child: CircularProgressIndicator(strokeWidth: 3),
          ),
        ),
      ),
    );
  }
}
