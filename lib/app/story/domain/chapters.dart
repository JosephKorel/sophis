import 'package:sophis/app/story/domain/philosopher_history.dart';

enum StoryChapters {
  introduction('Introduction'),
  life('Life and Biography'),
  ideas('Key Ideas and Philosophy'),
  legacy('Legacy and Influence');

  const StoryChapters(this.title);

  final String title;
}

extension PhilosopherStoryContent on StoryChapters {
  String content({required PhilosopherHistory philosopherStory}) {
    switch (name) {
      case 'introduction':
        return philosopherStory.introduction;
      case 'life':
        return philosopherStory.life;

      case 'ideas':
        return philosopherStory.ideas;

      case 'legacy':
        return philosopherStory.legacy;

      default:
        return philosopherStory.introduction;
    }
  }
}
