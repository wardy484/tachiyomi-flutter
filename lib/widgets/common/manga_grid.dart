import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MangaGrid extends ConsumerStatefulWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final Future<void> Function()? onRefresh;

  const MangaGrid({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    this.onRefresh,
  }) : super(key: key);

  @override
  _MangaGridState createState() => _MangaGridState();
}

class _MangaGridState extends ConsumerState<MangaGrid> {
  Future<void> _onRefresh() async {
    await widget.onRefresh!();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = 2;

        if (constraints.maxWidth > 1000) {
          crossAxisCount = 5;
        } else if (constraints.maxWidth > 800) {
          crossAxisCount = 4;
        } else if (constraints.maxWidth > 600) {
          crossAxisCount = 4;
        }

        var grid = GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 0.75,
          ),
          itemCount: widget.itemCount,
          itemBuilder: widget.itemBuilder,
        );

        if (widget.onRefresh == null) {
          return grid;
        }

        return RefreshIndicator(
          onRefresh: _onRefresh,
          child: grid,
        );
      },
    );
  }
}
