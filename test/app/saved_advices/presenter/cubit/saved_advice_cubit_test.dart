import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sophis/app/home/domain/philosopher_enum.dart';
import 'package:sophis/app/saved_advices/domain/saved_advice_entity.dart';
import 'package:sophis/app/saved_advices/presenter/cubit/saved_advice_cubit.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockSavedAdviceInteractions controller;
  late SavedAdviceCubit savedAdviceCubit;
  late SavedAdvice savedAdvice;

  setUp(() {
    savedAdvice = const SavedAdvice(
      philosopher: Philosophers.kant,
      userInput: '',
      advice: '',
    );
    controller = MockSavedAdviceInteractions();
    savedAdviceCubit = SavedAdviceCubit(controller);
  });

  group('Tests for savedAdviceCubit', () {
    test('Should be SavedAdviceInitial state', () {
      expect(
          const SavedAdviceInitial(savedAdvices: []), savedAdviceCubit.state);
    });

    blocTest(
      'Should emit states [SavedAdviceLoading and SavedAdvicesFetch]',
      build: () {
        when(controller.saveAdvice(advices: [savedAdvice]));

        return savedAdviceCubit;
      },
    );
  });
}
