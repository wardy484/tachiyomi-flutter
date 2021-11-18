// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import 'data/chapter/chapter.dart' as _i6;
import 'data/chapter_list/chapterlist.dart' as _i7;
import 'screens/chapters_page.dart' as _i2;
import 'screens/list_page.dart' as _i1;
import 'screens/read_page.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    ListRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.ListPage());
    },
    ChaptersRoute.name: (routeData) {
      final args = routeData.argsAs<ChaptersRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.ChaptersPage(
              key: args.key, mangaId: args.mangaId, mangaName: args.mangaName));
    },
    ReadRoute.name: (routeData) {
      final args = routeData.argsAs<ReadRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.ReadPage(
              key: args.key,
              mangaId: args.mangaId,
              chapter: args.chapter,
              chapters: args.chapters,
              currentChapter: args.currentChapter));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(ListRoute.name, path: '/'),
        _i4.RouteConfig(ChaptersRoute.name,
            path: '/chapters/:mangaName/:mangaId'),
        _i4.RouteConfig(ReadRoute.name, path: '/read/:mangaId')
      ];
}

/// generated route for [_i1.ListPage]
class ListRoute extends _i4.PageRouteInfo<void> {
  const ListRoute() : super(name, path: '/');

  static const String name = 'ListRoute';
}

/// generated route for [_i2.ChaptersPage]
class ChaptersRoute extends _i4.PageRouteInfo<ChaptersRouteArgs> {
  ChaptersRoute(
      {_i5.Key? key, required String mangaId, required String mangaName})
      : super(name,
            path: '/chapters/:mangaName/:mangaId',
            args: ChaptersRouteArgs(
                key: key, mangaId: mangaId, mangaName: mangaName),
            rawPathParams: {});

  static const String name = 'ChaptersRoute';
}

class ChaptersRouteArgs {
  const ChaptersRouteArgs(
      {this.key, required this.mangaId, required this.mangaName});

  final _i5.Key? key;

  final String mangaId;

  final String mangaName;
}

/// generated route for [_i3.ReadPage]
class ReadRoute extends _i4.PageRouteInfo<ReadRouteArgs> {
  ReadRoute(
      {_i5.Key? key,
      required String mangaId,
      required _i6.Chapter chapter,
      required _i7.ChapterList chapters,
      required int currentChapter})
      : super(name,
            path: '/read/:mangaId',
            args: ReadRouteArgs(
                key: key,
                mangaId: mangaId,
                chapter: chapter,
                chapters: chapters,
                currentChapter: currentChapter),
            rawPathParams: {});

  static const String name = 'ReadRoute';
}

class ReadRouteArgs {
  const ReadRouteArgs(
      {this.key,
      required this.mangaId,
      required this.chapter,
      required this.chapters,
      required this.currentChapter});

  final _i5.Key? key;

  final String mangaId;

  final _i6.Chapter chapter;

  final _i7.ChapterList chapters;

  final int currentChapter;
}
