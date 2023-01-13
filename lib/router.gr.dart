// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import 'app_page.dart' as _i2;
import 'auth/auth_guard.dart' as _i13;
import 'auth/screens/login_page.dart' as _i1;
import 'data/chapter/chapter.dart' as _i15;
import 'home/pages/home_tab.dart' as _i9;
import 'manga_details/presentation/manga_details_page.dart' as _i3;
import 'reader/presentation/reader_page.dart' as _i4;
import 'search/search_page.dart' as _i10;
import 'settings/presentation/account_settings_page.dart' as _i6;
import 'settings/presentation/add_source_page.dart' as _i8;
import 'settings/presentation/reader_settings_page.dart' as _i5;
import 'settings/presentation/source_settings_page.dart' as _i7;
import 'source/source.dart' as _i14;

class AppRouter extends _i11.RootStackRouter {
  AppRouter(
      {_i12.GlobalKey<_i12.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i13.AuthGuard authGuard;

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.LoginPage(key: args.key, onLogin: args.onLogin));
    },
    AppRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.AppPage());
    },
    MangaDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MangaDetailsRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.MangaDetailsPage(
              key: args.key,
              id: args.id,
              name: args.name,
              source: args.source));
    },
    ReaderRoute.name: (routeData) {
      final args = routeData.argsAs<ReaderRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.ReaderPage(
              key: args.key,
              source: args.source,
              mangaId: args.mangaId,
              chapter: args.chapter));
    },
    ReaderSettingsRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ReaderSettingsPage());
    },
    AccountSettingsRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.AccountSettingsPage());
    },
    SourceSettingsRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.SourceSettingsPage());
    },
    AddSourceRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.AddSourcePage());
    },
    BrowseSourceRoute.name: (routeData) {
      final args = routeData.argsAs<BrowseSourceRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.BrowseSourcePage(key: args.key, source: args.source));
    },
    SearchRoute.name: (routeData) {
      final args = routeData.argsAs<SearchRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.SearchPage(key: args.key, source: args.source));
    }
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(LoginRoute.name, path: '/login'),
        _i11.RouteConfig(AppRoute.name, path: '/', guards: [authGuard]),
        _i11.RouteConfig(MangaDetailsRoute.name, path: '/manga/:id/details'),
        _i11.RouteConfig(ReaderRoute.name, path: '/read/:mangaId'),
        _i11.RouteConfig(ReaderSettingsRoute.name, path: '/settings/reader'),
        _i11.RouteConfig(AccountSettingsRoute.name, path: '/settings/account'),
        _i11.RouteConfig(SourceSettingsRoute.name, path: '/settings/sources'),
        _i11.RouteConfig(AddSourceRoute.name, path: '/settings/sources/add'),
        _i11.RouteConfig(BrowseSourceRoute.name, path: '/browse/:sourceId'),
        _i11.RouteConfig(SearchRoute.name, path: '/browse/:sourceId/search')
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i11.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i12.Key? key, required void Function() onLogin})
      : super(LoginRoute.name,
            path: '/login', args: LoginRouteArgs(key: key, onLogin: onLogin));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, required this.onLogin});

  final _i12.Key? key;

  final void Function() onLogin;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onLogin: $onLogin}';
  }
}

/// generated route for
/// [_i2.AppPage]
class AppRoute extends _i11.PageRouteInfo<void> {
  const AppRoute() : super(AppRoute.name, path: '/');

  static const String name = 'AppRoute';
}

/// generated route for
/// [_i3.MangaDetailsPage]
class MangaDetailsRoute extends _i11.PageRouteInfo<MangaDetailsRouteArgs> {
  MangaDetailsRoute(
      {_i12.Key? key,
      required String id,
      required String name,
      required _i14.Source source})
      : super(MangaDetailsRoute.name,
            path: '/manga/:id/details',
            args: MangaDetailsRouteArgs(
                key: key, id: id, name: name, source: source));

  static const String name = 'MangaDetailsRoute';
}

class MangaDetailsRouteArgs {
  const MangaDetailsRouteArgs(
      {this.key, required this.id, required this.name, required this.source});

  final _i12.Key? key;

  final String id;

  final String name;

  final _i14.Source source;

  @override
  String toString() {
    return 'MangaDetailsRouteArgs{key: $key, id: $id, name: $name, source: $source}';
  }
}

/// generated route for
/// [_i4.ReaderPage]
class ReaderRoute extends _i11.PageRouteInfo<ReaderRouteArgs> {
  ReaderRoute(
      {_i12.Key? key,
      required _i14.Source source,
      required String mangaId,
      required _i15.Chapter chapter})
      : super(ReaderRoute.name,
            path: '/read/:mangaId',
            args: ReaderRouteArgs(
                key: key, source: source, mangaId: mangaId, chapter: chapter));

  static const String name = 'ReaderRoute';
}

class ReaderRouteArgs {
  const ReaderRouteArgs(
      {this.key,
      required this.source,
      required this.mangaId,
      required this.chapter});

  final _i12.Key? key;

  final _i14.Source source;

  final String mangaId;

  final _i15.Chapter chapter;

  @override
  String toString() {
    return 'ReaderRouteArgs{key: $key, source: $source, mangaId: $mangaId, chapter: $chapter}';
  }
}

/// generated route for
/// [_i5.ReaderSettingsPage]
class ReaderSettingsRoute extends _i11.PageRouteInfo<void> {
  const ReaderSettingsRoute()
      : super(ReaderSettingsRoute.name, path: '/settings/reader');

  static const String name = 'ReaderSettingsRoute';
}

/// generated route for
/// [_i6.AccountSettingsPage]
class AccountSettingsRoute extends _i11.PageRouteInfo<void> {
  const AccountSettingsRoute()
      : super(AccountSettingsRoute.name, path: '/settings/account');

  static const String name = 'AccountSettingsRoute';
}

/// generated route for
/// [_i7.SourceSettingsPage]
class SourceSettingsRoute extends _i11.PageRouteInfo<void> {
  const SourceSettingsRoute()
      : super(SourceSettingsRoute.name, path: '/settings/sources');

  static const String name = 'SourceSettingsRoute';
}

/// generated route for
/// [_i8.AddSourcePage]
class AddSourceRoute extends _i11.PageRouteInfo<void> {
  const AddSourceRoute()
      : super(AddSourceRoute.name, path: '/settings/sources/add');

  static const String name = 'AddSourceRoute';
}

/// generated route for
/// [_i9.BrowseSourcePage]
class BrowseSourceRoute extends _i11.PageRouteInfo<BrowseSourceRouteArgs> {
  BrowseSourceRoute({_i12.Key? key, required _i14.Source source})
      : super(BrowseSourceRoute.name,
            path: '/browse/:sourceId',
            args: BrowseSourceRouteArgs(key: key, source: source));

  static const String name = 'BrowseSourceRoute';
}

class BrowseSourceRouteArgs {
  const BrowseSourceRouteArgs({this.key, required this.source});

  final _i12.Key? key;

  final _i14.Source source;

  @override
  String toString() {
    return 'BrowseSourceRouteArgs{key: $key, source: $source}';
  }
}

/// generated route for
/// [_i10.SearchPage]
class SearchRoute extends _i11.PageRouteInfo<SearchRouteArgs> {
  SearchRoute({_i12.Key? key, required _i14.Source source})
      : super(SearchRoute.name,
            path: '/browse/:sourceId/search',
            args: SearchRouteArgs(key: key, source: source));

  static const String name = 'SearchRoute';
}

class SearchRouteArgs {
  const SearchRouteArgs({this.key, required this.source});

  final _i12.Key? key;

  final _i14.Source source;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key, source: $source}';
  }
}
