import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttiyomi/auth/auth_notifier.dart';
import 'package:fluttiyomi/database/models.dart';
import 'package:fluttiyomi/settings/presentation/settings_controller.dart';
import 'package:fluttiyomi/widgets/common/full_page_loading_indicator.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsTab extends HookConsumerWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsControllerProvider);

    return settings.when(
      data: (settings) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              SettingsForm(settings: settings),
              const Divider(height: 32),
              const Text(
                "Authentication settings",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ref.watch(authNotifierProvider).when(
                    unauthenticated: () =>
                        const Text("Unauthenticated - somethings gone wrong."),
                    authenticated: (user) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Provider: ${user.providerId}"),
                        const SizedBox(height: 8),
                        Text("Name: ${user.name}"),
                        const SizedBox(height: 8),
                        Text("Email: ${user.email}"),
                      ],
                    ),
                  ),
            ],
          ),
        );
      },
      error: ((error, stackTrace) => Center(
            child: Text(error.toString()),
          )),
      loading: () => const FullPageLoadingIndicator(),
    );
  }
}

class SettingsForm extends HookConsumerWidget {
  final Setting settings;

  const SettingsForm({
    Key? key,
    required this.settings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useState(GlobalKey<FormBuilderState>());
    return FormBuilder(
      key: formKey.value,
      child: Column(
        children: <Widget>[
          FormBuilderSlider(
            name: 'padding',
            initialValue: settings.padding.toDouble(),
            decoration: const InputDecoration(
              labelText: 'Edge padding amount',
              border: InputBorder.none,
            ),
            onChanged: (newValue) {
              if (newValue != null && newValue.toInt() != settings.padding) {
                ref
                    .read(settingsControllerProvider.notifier)
                    .updatePadding(newValue.toInt());
              }
            },
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context),
              FormBuilderValidators.max(context, 150),
            ]),
            max: 150,
            min: 0,
            divisions: 30,
          ),
        ],
      ),
    );
  }
}
