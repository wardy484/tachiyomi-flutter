import 'package:fluttiyomi/data/chapter_details/chapter_details.dart';

abstract class Event<T> {
  T getPayload();
}

class ChapterOpened extends Event<ChapterDetails> {
  ChapterDetails chapterDetails;

  ChapterOpened(this.chapterDetails);

  @override
  ChapterDetails getPayload() {
    return chapterDetails;
  }
}

class ChapterRead extends Event<ChapterDetails> {
  ChapterDetails chapterDetails;

  ChapterRead(this.chapterDetails);

  @override
  ChapterDetails getPayload() {
    return chapterDetails;
  }
}
