import 'package:flutter/material.dart';
import 'package:fluttiyomi/database/database.dart';
import 'package:fluttiyomi/event_service_provider.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:fluttiyomi/router.gr.dart';
import 'package:fluttiyomi/widgets/refresh_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer();
  container.read(sourceClientProvider.state).state = await SourceClient.init();

  await container.read(isarDatabaseProvider).init();

  // await SentryFlutter.init(
  //   (options) {
  //     options.dsn =
  //         'https://7fe8e00f82e64d7d83a6fb366a762855@o1207946.ingest.sentry.io/6341248';
  //     // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
  //     // We recommend adjusting this value in production.
  //     options.tracesSampleRate = 1.0;
  //   },
  //   appRunner: () => runApp(MyApp()),
  // );

  container.read(eventsProvider).registerGlobalEvents();

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshConfig(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Fluttiyomi',
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
        ),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
