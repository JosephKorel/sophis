import 'package:sophis/app/home/domain/philosopher_entity.dart';

enum Philosophers {
  seneca,
  kant,
  nietzsche,
  plato,
  descartes,
  confucius;

  String philosopherName() {
    return [
      'Seneca',
      'Immanuel Kant',
      'Friedrich Nietzsche',
      'Plato',
      'René Descartes',
      'Confucius',
    ][index];
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
      case 'plato':
        return const PhilosopherEntity(
          name: 'Plato',
          country: 'Greece',
          school: 'Platonism',
          quote:
              '''"The penalty good men pay for indifference to public affairs is to be ruled by evil men."''',
          image: 'assets/plato.png',
        );
      case 'descartes':
        return const PhilosopherEntity(
          name: 'René Descartes',
          country: 'France',
          school: 'Rationalism',
          quote: '"I think, therefore I am."',
          image: 'assets/descartes.png',
        );

      case 'confucius':
        return const PhilosopherEntity(
          name: 'Confucius',
          country: 'China',
          school: 'Confucianism',
          quote:
              '''"Our greatest glory is not in never falling, but in rising every time we fall."''',
          image: 'assets/confucius.png',
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
Seneca, a Stoic Philosopher, encourages wisdom, virtue, and resilience in the face of life's challenges. Seek his Stoic wisdom in your quest for guidance.''';

      case 'kant':
        return '''Kant's Philosophy of Ethics emphasizes the importance of moral principles and universal laws. Ask him for ethical guidance.''';

      case 'nietzsche':
        return '''Nietzsche's Existentialist Philosophy explores individualism and the will to power. Seek advice through his unique lens of philosophy.''';

      case 'plato':
        return '''Plato, the philosopher of Platonism, delves into the realm of Forms and the pursuit of knowledge. Discover the world of ideal forms and philosophical truths through his guidance.''';

      case 'descartes':
        return '''René Descartes, the prominent rationalist philosopher, advocates for reason and skepticism. Explore the world of clear and distinct ideas as you seek his guidance in matters of critical thinking and doubt.''';

      case 'confucius':
        return '''Confucius, a renowned philosopher of Confucianism, emphasizes the importance of ethics, family values, and social harmony. Seek his wisdom for guidance in matters of virtue and harmonious living.''';

      default:
        return '';
    }
  }
}

extension AdviceLoadingPhrase on Philosophers {
  String loadingPhrase() {
    switch (name) {
      case 'seneca':
        return '''
Patience is the companion of wisdom.''';

      case 'kant':
        return '''Time and patience are the strongest warriors.''';

      case 'nietzsche':
        return '''In the stillness of patience, we find the wisdom to wait for the right moment.''';

      case 'plato':
        return '''A moment's patience can prevent a lifetime of regret.''';

      case 'descartes':
        return '''The reading of all good books is like a conversation with the finest minds of past centuries.''';

      case 'confucius':
        return '''It does not matter how slowly you go as long as you do not stop.''';

      default:
        return '';
    }
  }
}
