import 'package:sophis/domain/philosopher_entity.dart';

enum Philosophers {
  seneca,
  kant,
  nietzsche;

  PhilosopherEntity info() {
    switch (name) {
      case 'seneca':
        return PhilosopherEntity(
          name: 'Seneca',
          country: 'Spain',
          school: 'Stoicism',
          quote: '"Luck is what happens when preparation meets opportunity."',
          image: 'assets/seneca.png',
        );

      case 'kant':
        return PhilosopherEntity(
          name: 'Immanuel Kant',
          country: 'Germany',
          school: 'Critical Philosophy',
          quote:
              '''"Act only according to that maxim by which you can at the same time will that it should become a universal law."''',
          image: 'assets/kant.png',
        );

      case 'nietzsche':
        return PhilosopherEntity(
          name: 'Friedrich Nietzsche',
          country: 'Germany',
          school: 'Existentialism',
          quote:
              '''"He who fights with monsters should be careful lest he thereby become a monster. And if you gaze long enough into an abyss, the abyss also gazes into you."''',
          image: 'assets/nietzsche.png',
        );

      default:
        return PhilosopherEntity(
          name: 'Seneca',
          country: 'Spain',
          school: 'Stoicism',
          quote: 'Lorem Ipsum',
          image: 'seneca.jpg',
        );
    }
  }
}
