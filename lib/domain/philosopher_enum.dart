import 'package:sophis/domain/philosopher_entity.dart';

enum Philosophers {
  seneca,
  kant,
  nietzsche;

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
