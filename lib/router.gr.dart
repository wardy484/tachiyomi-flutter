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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import 'auth/auth_guard.dart' as _i8;
import 'auth/screens/login_page.dart' as _i1;
import 'chapter_updates/chapter_updates.dart' as _i5;
import 'data/chapter/chapter.dart' as _i10;
import 'data/chapter_list/chapterlist.dart' as _i11;
import 'favourites/favourite.dart' as _i9;
import 'screens/chapters_page.dart' as _i3;
import 'screens/list_page.dart' as _i2;
import 'screens/read_page.dart' as _i4;

class AppRouter extends _i6.RootStackRouter {
  AppRouter(
      {_i7.GlobalKey<_i7.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i8.AuthGuard authGuard;

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.LoginPage(key: args.key, onLogin: args.onLogin));
    },
    ListRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.ListPage());
    },
    ChaptersRoute.name: (routeData) {
      final args = routeData.argsAs<ChaptersRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.ChaptersPage(
              key: args.key,
              mangaId: args.mangaId,
              mangaName: args.mangaName,
              favourite: args.favourite));
    },
    ReadRoute.name: (routeData) {
      final args = routeData.argsAs<ReadRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.ReadPage(
              key: args.key,
              mangaId: args.mangaId,
              chapter: args.chapter,
              chapters: args.chapters,
              resumeFrom: args.resumeFrom,
              favourite: args.favourite));
    },
    ChaperUpdatesRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ChaperUpdatesPage());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(LoginRoute.name, path: '/login'),
        _i6.RouteConfig(ListRoute.name, path: '/', guards: [authGuard]),
        _i6.RouteConfig(ChaptersRoute.name,
            path: '/chapters/:mangaName/:mangaId'),
        _i6.RouteConfig(ReadRoute.name, path: '/read/:mangaId'),
        _i6.RouteConfig(ChaperUpdatesRoute.name, path: '/chapter-updates')
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i7.Key? key, required void Function() onLogin})
      : super(LoginRoute.name,
            path: '/login', args: LoginRouteArgs(key: key, onLogin: onLogin));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, required this.onLogin});

  final _i7.Key? key;

  final void Function() onLogin;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onLogin: $onLogin}';
  }
}

/// generated route for
/// [_i2.ListPage]
class ListRoute extends _i6.PageRouteInfo<void> {
  const ListRoute() : super(ListRoute.name, path: '/');

  static const String name = 'ListRoute';
}

/// generated route for
/// [_i3.ChaptersPage]
class ChaptersRoute extends _i6.PageRouteInfo<ChaptersRouteArgs> {
  ChaptersRoute(
      {_i7.Key? key,
      required String mangaId,
      required String mangaName,
      required _i9.Favourite? favourite})
      : super(ChaptersRoute.name,
            path: '/chapters/:mangaName/:mangaId',
            args: ChaptersRouteArgs(
                key: key,
                mangaId: mangaId,
                mangaName: mangaName,
                favourite: favourite));

  static const String name = 'ChaptersRoute';
}

class ChaptersRouteArgs {
  const ChaptersRouteArgs(
      {this.key,
      required this.mangaId,
      required this.mangaName,
      required this.favourite});

  final _i7.Key? key;

  final String mangaId;

  final String mangaName;

  final _i9.Favourite? favourite;

  @override
  String toString() {
    return 'ChaptersRouteArgs{key: $key, mangaId: $mangaId, mangaName: $mangaName, favourite: $favourite}';
  }
}

/// generated route for
/// [_i4.ReadPage]
class ReadRoute extends _i6.PageRouteInfo<ReadRouteArgs> {
  ReadRoute(
      {_i7.Key? key,
      required String mangaId,
      required _i10.Chapter chapter,
      required _i11.ChapterList chapters,
      int? resumeFrom,
      _i9.Favourite? favourite})
      : super(ReadRoute.name,
            path: '/read/:mangaId',
            args: ReadRouteArgs(
                key: key,
                mangaId: mangaId,
                chapter: chapter,
                chapters: chapters,
                resumeFrom: resumeFrom,
                favourite: favourite));

  static const String name = 'ReadRoute';
}

class ReadRouteArgs {
  const ReadRouteArgs(
      {this.key,
      required this.mangaId,
      required this.chapter,
      required this.chapters,
      this.resumeFrom,
      this.favourite});

  final _i7.Key? key;

  final String mangaId;

  final _i10.Chapter chapter;

  final _i11.ChapterList chapters;

  final int? resumeFrom;

  final _i9.Favourite? favourite;

  @override
  String toString() {
    return 'ReadRouteArgs{key: $key, mangaId: $mangaId, chapter: $chapter, chapters: $chapters, resumeFrom: $resumeFrom, favourite: $favourite}';
  }
}

/// generated route for
/// [_i5.ChaperUpdatesPage]
class ChaperUpdatesRoute extends _i6.PageRouteInfo<void> {
  const ChaperUpdatesRoute()
      : super(ChaperUpdatesRoute.name, path: '/chapter-updates');

  static const String name = 'ChaperUpdatesRoute';
}
