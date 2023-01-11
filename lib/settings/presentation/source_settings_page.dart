import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttiyomi/database/installed_source_model.dart';
import 'package:fluttiyomi/router.gr.dart';
import 'package:fluttiyomi/settings/presentation/installed_source_controller.dart';
import 'package:fluttiyomi/widgets/common/full_page_loading_indicator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SourceSettingsPage extends HookConsumerWidget {
  const SourceSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sources"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ref.watch(installedSourceStreamProvider).when(
              data: (sources) => sources.isEmpty
                  ? const Center(
                      child:
                          Text("No sources installed, click add to add one."),
                    )
                  : ListView.separated(
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: sources.length,
                      itemBuilder: (context, index) {
                        final source = sources[index];
                        return SourceTile(
                          source: source,
                          onDeletePressed: () {
                            ref
                                .read(
                                    installedSourceControllerProvider.notifier)
                                .removeSource(source);
                          },
                        );
                      },
                    ),
              loading: () => const FullPageLoadingIndicator(),
              error: (error, stackTrace) => Center(
                child: Text(error.toString()),
              ),
            ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).push(const AddSourceRoute());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SourceTile extends ConsumerWidget {
  const SourceTile({
    Key? key,
    required this.source,
    this.onPressed,
    this.onDeletePressed,
  }) : super(key: key);

  final InstalledSource source;
  final void Function()? onPressed;
  final void Function()? onDeletePressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: onPressed,
      leading: source.iconPath != ""
          ? CachedNetworkImage(
              imageUrl: source.iconPath,
              fit: BoxFit.fill,
              height: 32,
              width: 32,
            )
          : const Icon(Icons.question_mark_rounded),
      title: Text(source.name),
      subtitle: Text(source.sourceId),
      trailing: onDeletePressed != null
          ? IconButton(
              icon: const Icon(Icons.delete),
              onPressed: onDeletePressed,
            )
          : null,
    );
  }
}
