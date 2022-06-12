import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttiyomi/auth/auth_notifier.dart';
import 'package:fluttiyomi/settings/settings_notifier.dart';
import 'package:fluttiyomi/widgets/common/full_page_loading_indicator.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsTab extends ConsumerStatefulWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends ConsumerState<SettingsTab> {
  final _formKey = GlobalKey<FormBuilderState>();

  int padding = 0;
  bool showFps = false;

  @override
  void initState() {
    super.initState();

    ref.read(settingsProvider.notifier).loadSettings();
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(settingsProvider).when(
      initial: () {
        return const FullPageLoadingIndicator();
      },
      loaded: (settings) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              FormBuilder(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    FormBuilderSlider(
                      name: 'padding',
                      initialValue: settings.padding.toDouble(),
                      decoration: const InputDecoration(
                        labelText: 'Pillar box amount',
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          padding = newValue is double ? newValue.toInt() : 0;
                        });
                      },
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.max(context, 500),
                      ]),
                      max: 500,
                      min: 0,
                      divisions: 20,
                    ),
                    FormBuilderSwitch(
                      name: 'showFps',
                      title: const Text("Show FPS"),
                      initialValue: settings.showFps,
                      decoration: const InputDecoration(
                        labelText: 'Show FPS',
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          showFps = newValue is bool ? newValue : false;
                        });
                      },
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                      ]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  MaterialButton(
                    color: Theme.of(context).colorScheme.primary,
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      EasyLoading.show(status: 'Saving...');

                      await ref
                          .read(settingsProvider.notifier)
                          .updatePadding(padding);

                      await ref
                          .read(settingsProvider.notifier)
                          .updateShowFps(showFps);

                      EasyLoading.showSuccess('Saved!');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Divider(),
              const SizedBox(height: 8),
              const Text(
                "Authentication settings",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ref.watch(authNotifierProvider).when(
                    unauthenticated: () =>
                        const Text("Unauthenticated - somethings gone wrong."),
                    authenticated: (user) => Text(
                      "Provider: ${user.providerId} | Name: ${user.name} | Email: ${user.email}",
                    ),
                  ),
              const SizedBox(height: 8),
              const Divider(),
              const SizedBox(height: 8),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                child: const Text(
                  "Link with El Goog",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  await ref
                      .read(authNotifierProvider.notifier)
                      .signInWithGoogle();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
