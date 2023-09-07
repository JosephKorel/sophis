import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sophis/app/saved_advices/domain/saved_advice_entity.dart';
import 'package:sophis/app/saved_advices/presenter/controller/saved_advice_controller.dart';

void main() {
  late AdviceInteraction adviceInteraction;
  late SavedAdvice savedAdvice;

  setUp(() {
    savedAdvice = const SavedAdvice(
      philosopherName: '',
      philosopherSchool: '',
      userInput: '',
      advice: '',
    );
  });

  group('Test shared preferences operations', () {
    test('Should receive a list of saved advices', () async {
      SharedPreferences.setMockInitialValues({});
      final sharedPreferences = await SharedPreferences.getInstance();

      adviceInteraction = AdviceInteraction(sharedPreferences);

      final advices = adviceInteraction.getAdvices();

      expect(advices, isA<List<SavedAdvice>>());
    });

    test(
        'Should save a saved advice instance and expect length one list of saved advices',
        () async {
      SharedPreferences.setMockInitialValues({});
      final sharedPreferences = await SharedPreferences.getInstance();

      adviceInteraction = AdviceInteraction(sharedPreferences);

      await adviceInteraction.saveAdvice(advices: [savedAdvice]);

      final advices = adviceInteraction.getAdvices();

      expect(1, advices.length);
    });
  });
}
