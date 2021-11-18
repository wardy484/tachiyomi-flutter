import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttiyomi/data/reader_appbar/readerappbar_cubit.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:fluttiyomi/manga_dex/chapter_details/chapter_details_cubit.dart';
import 'package:fluttiyomi/manga_dex/chapters/chapter_cubit.dart';
import 'package:fluttiyomi/manga_dex/reader_progress/reader_progress_cubit.dart';
import 'package:fluttiyomi/manga_dex/manga_details/manga_details_cubit.dart';
import 'package:fluttiyomi/manga_dex/search/cubit/search_cubit.dart';
import 'package:fluttiyomi/router.gr.dart';
import 'package:fluttiyomi/widgets/refresh_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SourceClient _source = await SourceClient.init();
  ReaderProgressCubit _readerProgress = ReaderProgressCubit();

  runApp(
    ProviderScope(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SearchCubit>(
            create: (context) => SearchCubit(_source),
          ),
          BlocProvider<ChapterCubit>(
            create: (context) => ChapterCubit(_source),
          ),
          BlocProvider<MangaDetailsCubit>(
            create: (context) => MangaDetailsCubit(_source),
          ),
          BlocProvider<ChapterDetailsCubit>(
            create: (context) => ChapterDetailsCubit(_source, _readerProgress),
          ),
          BlocProvider<ReaderappbarCubit>(
            create: (context) => ReaderappbarCubit(),
          ),
          BlocProvider<ReaderProgressCubit>(
            create: (context) => ReaderProgressCubit(),
          ),
        ],
        child: MyApp(),
      ),
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
