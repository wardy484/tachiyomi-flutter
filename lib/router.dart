import 'package:auto_route/auto_route.dart';
import 'package:fluttiyomi/auth/auth_guard.dart';
import 'package:fluttiyomi/auth/screens/login_page.dart';
import 'package:fluttiyomi/manga_details/presentation/manga_details_page.dart';
import 'package:fluttiyomi/app_page.dart';
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
      page: AppPage,
      initial: true,
      guards: [
        AuthGuard,
      ],
    ),
    AutoRoute(
      path: '/manga/:id/details',
      page: MangaDetailsPage,
    ),
    AutoRoute(
      path: '/read/:mangaId',
      page: ReadPage,
    ),
  ],
)
class $AppRouter {}
