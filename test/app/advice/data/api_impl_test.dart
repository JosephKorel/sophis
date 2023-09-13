import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sophis/app/advice/data/api_impl.dart';
import 'package:sophis/app/advice/data/data_source.dart';
import 'package:sophis/app/advice/domain/request_body.dart';
import 'package:sophis/app/core/error.dart';
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

  group('Tests for api implementation', () {
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

      // assert
      expect(result, equals(const Right(responseAdvice)));
    });

    test('Should receive a connection error', () async {
      // arrange
      when(
        dataSourceRepository.postRequest(body: body),
      ).thenThrow(
        DioException(
          requestOptions: RequestOptions(),
          type: DioExceptionType.connectionError,
        ),
      );

      // act
      final result = await apiRepositoryImpl.getAdvice(
        philosopher: philosopher,
        userInput: userInput,
      );

      // assert
      expect(
        result,
        equals(
          const Left(
            ConnectionFailure('Connection error'),
          ),
        ),
      );
    });

    test('Should receive a server error', () async {
      // arrange
      when(
        dataSourceRepository.postRequest(body: body),
      ).thenThrow(
        DioException(
          requestOptions: RequestOptions(),
          type: DioExceptionType.receiveTimeout,
        ),
      );

      // act
      final result = await apiRepositoryImpl.getAdvice(
        philosopher: philosopher,
        userInput: userInput,
      );

      // assert
      expect(
        result,
        equals(
          const Left(
            ResponseFailure('Unknown error'),
          ),
        ),
      );
    });
  });
}
