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
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import 'auth/auth_guard.dart' as _i7;
import 'auth/screens/login_page.dart' as _i1;
import 'data/chapter/chapter.dart' as _i8;
import 'data/chapter_list/chapterlist.dart' as _i9;
import 'favourites/data/favourite.dart' as _i10;
import 'manga_details/presentation/manga_details_page.dart' as _i3;
import 'screens/list_page.dart' as _i2;
import 'screens/read_page.dart' as _i4;

class AppRouter extends _i5.RootStackRouter {
  AppRouter(
      {_i6.GlobalKey<_i6.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i7.AuthGuard authGuard;

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.LoginPage(key: args.key, onLogin: args.onLogin));
    },
    ListRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.ListPage());
    },
    MangaDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MangaDetailsRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.MangaDetailsPage(key: args.key, id: args.id));
    },
    ReadRoute.name: (routeData) {
      final args = routeData.argsAs<ReadRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.ReadPage(
              key: args.key,
              mangaId: args.mangaId,
              chapter: args.chapter,
              chapters: args.chapters,
              resumeFrom: args.resumeFrom,
              favourite: args.favourite));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(LoginRoute.name, path: '/login'),
        _i5.RouteConfig(ListRoute.name, path: '/', guards: [authGuard]),
        _i5.RouteConfig(MangaDetailsRoute.name, path: '/manga/:id/details'),
        _i5.RouteConfig(ReadRoute.name, path: '/read/:mangaId')
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i6.Key? key, required void Function() onLogin})
      : super(LoginRoute.name,
            path: '/login', args: LoginRouteArgs(key: key, onLogin: onLogin));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, required this.onLogin});

  final _i6.Key? key;

  final void Function() onLogin;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onLogin: $onLogin}';
  }
}

/// generated route for
/// [_i2.ListPage]
class ListRoute extends _i5.PageRouteInfo<void> {
  const ListRoute() : super(ListRoute.name, path: '/');

  static const String name = 'ListRoute';
}

/// generated route for
/// [_i3.MangaDetailsPage]
class MangaDetailsRoute extends _i5.PageRouteInfo<MangaDetailsRouteArgs> {
  MangaDetailsRoute({_i6.Key? key, required String id})
      : super(MangaDetailsRoute.name,
            path: '/manga/:id/details',
            args: MangaDetailsRouteArgs(key: key, id: id));

  static const String name = 'MangaDetailsRoute';
}

class MangaDetailsRouteArgs {
  const MangaDetailsRouteArgs({this.key, required this.id});

  final _i6.Key? key;

  final String id;

  @override
  String toString() {
    return 'MangaDetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i4.ReadPage]
class ReadRoute extends _i5.PageRouteInfo<ReadRouteArgs> {
  ReadRoute(
      {_i6.Key? key,
      required String mangaId,
      required _i8.Chapter chapter,
      required _i9.ChapterList chapters,
      int? resumeFrom,
      _i10.Favourite? favourite})
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

  final _i6.Key? key;

  final String mangaId;

  final _i8.Chapter chapter;

  final _i9.ChapterList chapters;

  final int? resumeFrom;

  final _i10.Favourite? favourite;

  @override
  String toString() {
    return 'ReadRouteArgs{key: $key, mangaId: $mangaId, chapter: $chapter, chapters: $chapters, resumeFrom: $resumeFrom, favourite: $favourite}';
  }
}
