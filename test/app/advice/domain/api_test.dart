import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sophis/app/advice/domain/api.dart';
import 'package:sophis/app/home/domain/philosopher_enum.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  MockApiRepository apiRepository;
  ApiUseCase apiUseCase;

  setUp(() {
    apiRepository = MockApiRepository();
    apiUseCase = ApiUseCase(apiRepository);
  });

  const philosopher = Philosophers.kant;
  const userInput = 'Give me some advice';
  const receivedAdvice = "Here's your advice";

  test('Should get a string from api repository', () async {
    apiRepository = MockApiRepository();
    apiUseCase = ApiUseCase(apiRepository);

    // arrange
    when(
      apiRepository.getAdvice(
        philosopher: philosopher.info(),
        userInput: userInput,
      ),
    ).thenAnswer((_) async => const Right(receivedAdvice));

    // act
    final result = await apiUseCase.call(
      philosopher: philosopher.info(),
      userInput: userInput,
    );

    // assert
    expect(result, const Right(receivedAdvice));
  });
}
