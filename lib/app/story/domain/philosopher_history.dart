import 'package:sophis/app/home/domain/philosopher_enum.dart';
import 'package:sophis/app/story/domain/history_content.dart';

final class PhilosopherHistory {
  PhilosopherHistory({
    required this.philosopher,
    required this.introduction,
    required this.life,
    required this.ideas,
    required this.legacy,
  });

  final Philosophers philosopher;
  final String introduction;
  final String life;
  final String ideas;
  final String legacy;
}

extension PersonalHistory on Philosophers {
  PhilosopherHistory story() {
    switch (name) {
      case 'seneca':
        return senecaStory;

      default:
        return senecaStory;
    }
  }
}
