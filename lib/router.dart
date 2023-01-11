import 'package:auto_route/auto_route.dart';
import 'package:fluttiyomi/auth/auth_guard.dart';
import 'package:fluttiyomi/auth/screens/login_page.dart';
import 'package:fluttiyomi/home/pages/home_tab.dart';
import 'package:fluttiyomi/manga_details/presentation/manga_details_page.dart';
import 'package:fluttiyomi/app_page.dart';
import 'package:fluttiyomi/reader/presentation/reader_page.dart';
import 'package:fluttiyomi/settings/presentation/account_settings_page.dart';
import 'package:fluttiyomi/settings/presentation/add_source_page.dart';
import 'package:fluttiyomi/settings/presentation/reader_settings_page.dart';
import 'package:fluttiyomi/settings/presentation/source_settings_page.dart';

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
      page: ReaderPage,
    ),
    AutoRoute(
      path: '/settings/reader',
      page: ReaderSettingsPage,
    ),
    AutoRoute(
      path: '/settings/account',
      page: AccountSettingsPage,
    ),
    AutoRoute(
      path: '/settings/sources',
      page: SourceSettingsPage,
    ),
    AutoRoute(
      path: '/settings/sources/add',
      page: AddSourcePage,
    ),
    AutoRoute(
      path: '/browse/:sourceId',
      page: BrowseSourcePage,
    ),
  ],
)
class $AppRouter {}
