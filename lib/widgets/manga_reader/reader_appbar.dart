import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttiyomi/data/chapter/chapter.dart';
import 'package:fluttiyomi/data/reader_appbar/readerappbar_cubit.dart';

class ReaderAppBar extends StatelessWidget with PreferredSizeWidget {
  final Chapter chapter;

  const ReaderAppBar({
    Key? key,
    required this.chapter,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReaderappbarCubit, ReaderappbarState>(
      builder: (context, state) {
        return AnimatedOpacity(
          opacity: state.when(
            visible: () => 1,
            hidden: () => 0,
          ),
          duration: const Duration(milliseconds: 100),
          child: AppBar(
            title: Text(
              chapter.name ?? "Chapter ${chapter.chapterNo}",
            ),
            backgroundColor: Colors.black.withOpacity(0.9),
            elevation: 0,
          ),
        );
      },
    );
  }
}
