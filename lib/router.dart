import 'package:auto_route/auto_route.dart';
import 'package:fluttiyomi/screens/chapters_page.dart';
import 'package:fluttiyomi/screens/list_page.dart';
import 'package:fluttiyomi/screens/read_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: ListPage,
      initial: true,
    ),
    AutoRoute(
      path: '/chapters/:mangaName/:mangaId',
      page: ChaptersPage,
    ),
    AutoRoute(
      path: '/read/:mangaId',
      page: ReadPage,
    )
  ],
)
class $AppRouter {}
