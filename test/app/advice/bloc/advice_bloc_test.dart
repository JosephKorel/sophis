import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sophis/app/advice/domain/api.dart';
import 'package:sophis/app/advice/presenter/bloc/advice_bloc.dart';
import 'package:sophis/app/core/error.dart';
import 'package:sophis/app/home/domain/philosopher_enum.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockApiRepository apiRepository;
  late ApiUseCase apiUseCase;
  late AdviceBloc adviceBloc;

  setUp(() {
    apiRepository = MockApiRepository();
    apiUseCase = ApiUseCase(apiRepository);
    adviceBloc = AdviceBloc(apiUseCase);
  });

  const philosopher = Philosophers.kant;
  const userInput = 'Give me some advice';
  const receivedAdvice = "Here's your advice";

  group('Test bloc events', () {
    test('Initial advice bloc state should be InitialAdvice', () {
      expect(adviceBloc.state, AdviceInitial());
    });

    blocTest<AdviceBloc, AdviceState>(
      'Should emit [LoadingAdvice, ReceviedAdvice]',
      build: () {
        when(
          apiUseCase.call(
            philosopher: philosopher.info(),
            userInput: userInput,
          ),
        ).thenAnswer((_) async => const Right(receivedAdvice));

        return adviceBloc;
      },
      act: (bloc) => bloc.add(
        FetchAdviceEvent(
          philosopherEntity: philosopher.info(),
          userInput: userInput,
        ),
      ),
      expect: () => [
        AdviceInitial(),
        const ReceivedAdvice(
          philosopher: philosopher,
          advice: receivedAdvice,
          userInput: userInput,
        ),
      ],
    );

    blocTest<AdviceBloc, AdviceState>(
      'Should emit [LoadingAdvice, AdviceFailure]',
      build: () {
        when(
          apiUseCase.call(
            philosopher: philosopher.info(),
            userInput: userInput,
          ),
        ).thenAnswer(
          (_) async => const Left(
            ResponseFailure('Error'),
          ),
        );

        return adviceBloc;
      },
      act: (bloc) => bloc.add(
        FetchAdviceEvent(
          philosopherEntity: philosopher.info(),
          userInput: userInput,
        ),
      ),
      expect: () => [
        AdviceInitial(),
        const AdviceFailure(
          exception: ResponseFailure('Error'),
          philosopher: philosopher,
          userInput: userInput,
        ),
      ],
    );
  });
}
