import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
                    FormBuilderTextField(
                      name: 'padding',
                      initialValue: settings.padding.toString(),
                      decoration: const InputDecoration(
                        labelText: 'Pillar box amount',
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          padding = int.tryParse(newValue ?? "0") ?? 0;
                        });
                      },
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.numeric(context),
                        FormBuilderValidators.max(context, 70),
                      ]),
                      keyboardType: TextInputType.number,
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
                    onPressed: () {
                      ref
                          .read(settingsProvider.notifier)
                          .updatePadding(padding);
                    },
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
