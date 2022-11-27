import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttiyomi/auth/auth_guard.dart';
import 'package:fluttiyomi/database/database.dart';
import 'package:fluttiyomi/downloads/download_notifier.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:fluttiyomi/router.gr.dart';
import 'package:fluttiyomi/settings/settings_notifier.dart';
import 'package:fluttiyomi/widgets/refresh_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
  );

  final container = ProviderContainer();
  container.read(sourceClientProvider.state).state = await SourceClient.init();

  await container.read(isarDatabaseProvider).init();
  await container.read(settingsProvider.notifier).loadSettings();

  container.read(downloadProvider.notifier).startDownloadQueue();

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

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  late final AppRouter _appRouter;

  @override
  void initState() {
    _appRouter = AppRouter(
      authGuard: ref.read(authGuardProvider),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshConfig(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Fluttiyomi',
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
        ),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
