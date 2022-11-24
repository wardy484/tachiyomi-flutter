import 'package:auto_route/auto_route.dart';
import 'package:fluttiyomi/auth/auth_guard.dart';
import 'package:fluttiyomi/auth/screens/login_page.dart';
import 'package:fluttiyomi/chapter_updates/chapter_updates.dart';
import 'package:fluttiyomi/screens/chapters_page.dart';
import 'package:fluttiyomi/screens/list_page.dart';
import 'package:fluttiyomi/screens/read_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/login',
      page: LoginPage,
    ),
    AutoRoute(
      path: '/',
      page: ListPage,
      initial: true,
      guards: [
        AuthGuard,
      ],
    ),
    AutoRoute(
      path: '/chapters/:mangaName/:mangaId',
      page: ChaptersPage,
    ),
    AutoRoute(
      path: '/read/:mangaId',
      page: ReadPage,
    ),
    AutoRoute(
      path: '/chapter-updates',
      page: ChaperUpdatesPage,
    )
  ],
)
class $AppRouter {}
