import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:sophis/app/story/domain/philosopher_history.dart';

enum HistoryChapters {
  introduction('Introduction'),
  life('Life and Biography'),
  ideas('Key Ideas and Philosophy'),
  legacy('Legacy and Influence');

  const HistoryChapters(this.title);

  final String title;

  IconData icon() {
    switch (name) {
      case 'introduction':
        return Symbols.history_edu_rounded;

      case 'life':
        return Symbols.person_book_rounded;

      case 'ideas':
        return Symbols.lightbulb_outline_rounded;

      case 'legacy':
        return Symbols.domino_mask;

      default:
        return Symbols.history_edu_rounded;
    }
  }
}

extension PhilosopherStoryContent on HistoryChapters {
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
