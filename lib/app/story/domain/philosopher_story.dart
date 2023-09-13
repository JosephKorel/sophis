import 'package:sophis/app/home/domain/philosopher_enum.dart';

final class PhilosopherStory {
  PhilosopherStory({
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
