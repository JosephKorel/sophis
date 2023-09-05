import 'package:sophis/app/home/domain/philosopher_entity.dart';

enum Philosophers {
  seneca,
  kant,
  nietzsche;

  String philosopherName() {
    return ['Seneca', 'Immanuel Kant', 'Friedrich Nietzsche'][index];
  }

  PhilosopherEntity info() {
    switch (name) {
      case 'seneca':
        return const PhilosopherEntity(
          name: 'Seneca',
          country: 'Spain',
          school: 'Stoicism',
          quote: '"Luck is what happens when preparation meets opportunity."',
          image: 'assets/seneca.png',
        );

      case 'kant':
        return const PhilosopherEntity(
          name: 'Immanuel Kant',
          country: 'Germany',
          school: 'Critical Philosophy',
          quote:
              '''"Experience without theory is blind, but theory without experience is mere intellectual play."''',
          image: 'assets/kant.png',
        );

      case 'nietzsche':
        return const PhilosopherEntity(
          name: 'Friedrich Nietzsche',
          country: 'Germany',
          school: 'Existentialism',
          quote:
              '''“He who fights with monsters should look to it that he himself does not become a monster.”''',
          image: 'assets/nietzsche.png',
        );

      default:
        return const PhilosopherEntity(
          name: 'Seneca',
          country: 'Spain',
          school: 'Stoicism',
          quote: 'Lorem Ipsum',
          image: 'seneca.jpg',
        );
    }
  }
}

extension AdviceDialogContent on Philosophers {
  String title() {
    switch (name) {
      case 'seneca':
        return '''
Seneca, a Stoic Philosopher, encourages wisdom, virtue, and resilience in the face of life's challenges. Seek his Stoic wisdom in your quest for guidance.
        ''';

      case 'kant':
        return '''Kant's Philosophy of Ethics emphasizes the importance of moral principles and universal laws. Ask him for ethical guidance.''';

      case 'nietzsche':
        return '''Nietzsche's Existentialist Philosophy explores individualism and the will to power. Seek advice through his unique lens of philosophy.''';

      default:
        return '';
    }
  }
}
