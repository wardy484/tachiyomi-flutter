import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttiyomi/data/reader_appbar/readerappbar_cubit.dart';
import 'package:fluttiyomi/manga_dex/chapter_details/chapter_details_cubit.dart';
import 'package:fluttiyomi/manga_dex/reader_progress/reader_progress_cubit.dart';

class ReaderBottomAppBar extends StatelessWidget {
  final int numberOfPages;

  const ReaderBottomAppBar({Key? key, required this.numberOfPages})
      : super(key: key);

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
          child: BottomAppBar(
            color: Colors.black.withOpacity(0.9),
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: BlocBuilder<ReaderProgressCubit, ReaderProgressState>(
                    builder: (context, state) {
                      String progress = state.when(
                        initial: () => "1",
                        progressed: (index) => index,
                      );

                      return Text(
                        "$progress/$numberOfPages",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        BlocProvider.of<ReaderProgressCubit>(context)
                            .moveProgress("1");

                        BlocProvider.of<ChapterDetailsCubit>(context)
                            .previousChapter();
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        BlocProvider.of<ReaderProgressCubit>(context)
                            .moveProgress("1");

                        BlocProvider.of<ChapterDetailsCubit>(context)
                            .nextChapter();
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
