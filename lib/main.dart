import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttiyomi/auth/auth_guard.dart';
import 'package:fluttiyomi/database/database.dart';
import 'package:fluttiyomi/local_notifications.dart';
import 'package:fluttiyomi/router.gr.dart';
import 'package:fluttiyomi/settings/application/source_service.dart';
import 'package:fluttiyomi/settings/data/installed_source_repository.dart';
import 'package:fluttiyomi/settings/presentation/installed_source_controller.dart';
import 'package:fluttiyomi/widgets/refresh_config.dart';
import 'package:fluttiyomi/work_manager.dart';
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

  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.requestPermission();

  await flutterLocalNotificationsPlugin.initialize(
    const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    ),
    onDidReceiveNotificationResponse:
        (NotificationResponse notificationResponse) async {
      // ...
    },
    onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
  );

  ProviderContainer container = ProviderContainer();
  await container.read(isarDatabaseProvider).init();
  await container.read(sourceServiceProvider).initialiseSources();

  await container.read(workManagerProvider).initialize(callbackDispatcher);

  await installTestSources(container);

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
          bottomAppBarColor: Colors.blueGrey,
          appBarTheme: AppBarTheme(
            scrolledUnderElevation: 0,
            backgroundColor: Colors.grey[800],
            elevation: 0,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            // backgroundColor: Colors.blueGrey[900],
            // elevation: 1,
            // type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.amber[800],
          ),
          bottomAppBarTheme: BottomAppBarTheme(
            color: Colors.blueGrey[900],
            elevation: 0,
          ),
        ),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        builder: EasyLoading.init(),
      ),
    );
  }
}

// Temporary function to install test sources
Future<void> installTestSources(ProviderContainer container) async {
  final testSources = [
    {
      "id": "readm",
      "url":
          "https://gist.githubusercontent.com/wardy484/74db6d1a96015b0574b17d113d04cc84/raw/7b2c58acc48f27e259ac3f77798ac5e839bba074/readm.yml",
    },
    {
      "id": "mangajar",
      "url":
          "https://gist.githubusercontent.com/wardy484/eab8bd651c1841a6e5d1d634211e1239/raw/d17ea39a4b1e8f7f2e4f7f25d2622ab376db4404/mangajar.yml",
    }
  ];

  for (final testSource in testSources) {
    final sourceId = testSource['id'] as String;
    final url = testSource['url'] as String;

    final source = await container
        .read(installedSourceRepositoryProvider)
        .getInstalledSource(sourceId);

    // Purge the source on first run so we can debug
    if (source != null) {
      container.read(installedSourceRepositoryProvider).delete(source);
    }

    await container
        .read(installedSourceControllerProvider.notifier)
        .addSource(url);
  }
}
