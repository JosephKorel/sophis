import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sophis/app/advice/data/api_impl.dart';
import 'package:sophis/app/advice/data/data_source.dart';
import 'package:sophis/app/advice/domain/request_body.dart';
import 'package:sophis/app/home/domain/philosopher_entity.dart';
import 'package:sophis/app/home/domain/philosopher_enum.dart';

import 'api_impl_test.mocks.dart';

@GenerateMocks([DataSourceRepository])
void main() {
  late MockDataSourceRepository dataSourceRepository;
  late ApiRepositoryImpl apiRepositoryImpl;
  late Map<String, dynamic> body;
  late ApiRequestBody requestBody;
  late PhilosopherEntity philosopher;
  late String userInput;

  setUp(() {
    dataSourceRepository = MockDataSourceRepository();
    apiRepositoryImpl = ApiRepositoryImpl(dataSourceRepository);
    philosopher = Philosophers.seneca.info();
    userInput = 'This is my input';
    requestBody = ApiRequestBody(
      modelPersonality: philosopher.getPhilosopher().personality(),
    );
    body = requestBody.body(userInput: userInput);
  });

  const responseAdvice = 'This is a test';

  test('Should receive a string', () async {
    // arrange
    when(
      dataSourceRepository.postRequest(body: body),
    ).thenAnswer(
      (_) async => responseAdvice,
    );

    // act
    final result = await apiRepositoryImpl.getAdvice(
      philosopher: philosopher,
      userInput: userInput,
    );

    debugPrint(result.toString());

    // assert
    expect(result, equals(const Right(responseAdvice)));
  });
}
