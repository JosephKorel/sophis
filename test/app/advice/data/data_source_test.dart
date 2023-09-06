import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sophis/app/advice/data/data_source.dart';
import 'package:sophis/app/advice/data/response_model.dart';

import '../../../constants/api_response.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockDioOperations dio;
  late DataSourceImpl dataSourceImpl;
  late Map<String, dynamic> body;

  setUp(() {
    dio = MockDioOperations();
    dataSourceImpl = DataSourceImpl(
      dio: dio,
      responseModel: ApiResponseModel(),
    );
    body = {'data': 'This is my data'};
  });

  const responseAdvice = 'This is a test';

  group('Test for different dio responses', () {
    test('Parse response JSON to string', () async {
      // arrange
      when(dio.post(body: body)).thenAnswer((_) async => gptResponse);

      // act
      final result = await dataSourceImpl.postRequest(body: body);

      // assert
      expect(responseAdvice, result);
    });

    test('Should receive exception', () async {
      // arrange
      when(dio.post(body: body)).thenThrow(Exception());

      // act
      final result = dataSourceImpl.postRequest(body: body);

      // assert
      expect(result, throwsA(isA<Exception>()));
    });
  });
}
