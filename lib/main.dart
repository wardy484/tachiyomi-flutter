import 'package:flutter/material.dart';
import 'package:fluttiyomi/database/database.dart';
import 'package:fluttiyomi/favourites/favourites_notifier.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:fluttiyomi/router.gr.dart';
import 'package:fluttiyomi/widgets/refresh_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer();
  container.read(sourceClientProvider.state).state = await SourceClient.init();

  await container.read(isarDatabaseProvider).init();

  container.read(favouritesProvider.notifier).checkForUpdates();

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
