import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttiyomi/settings/presentation/installed_source_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddSourcePage extends HookConsumerWidget {
  const AddSourcePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useState(GlobalKey<FormState>());
    final urlController = useTextEditingController(
      text:
          "https://gist.githubusercontent.com/wardy484/74db6d1a96015b0574b17d113d04cc84/raw/7b2c58acc48f27e259ac3f77798ac5e839bba074/readm.yml",
    );
    // final urlController = useTextEditingController(
    //   text:
    //       "https://gist.githubusercontent.com/wardy484/eab8bd651c1841a6e5d1d634211e1239/raw/c7da50d7ddf5010ee8a5f8799fb7dc6af68a6111/mangajar.yml",
    // );
    final loading = useState(false);
    final errorMessage = useState("");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add source"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: formKey.value,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: urlController,
                    enabled: !loading.value,
                    decoration: const InputDecoration(
                      labelText: "Source URL",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a source URL";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  if (errorMessage.value.isNotEmpty)
                    Text(
                      errorMessage.value,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: loading.value
                    ? null
                    : () async {
                        loading.value = true;

                        if (formKey.value.currentState!.validate()) {
                          try {
                            await ref
                                .read(
                                    installedSourceControllerProvider.notifier)
                                .addSource(urlController.text);

                            Navigator.of(context).pop();
                          } catch (e) {
                            errorMessage.value = e.toString();
                            loading.value = false;
                          }
                        }
                      },
                child: loading.value
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 3),
                      )
                    : const Text("Add"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
