import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../constants/api_response.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockDioOperations dioOperations;
  late Map<String, dynamic> body;

  setUp(() {
    dioOperations = MockDioOperations();
    body = {'data': 'This is my data'};
  });

  test('Response status code is 200 and the body is a Map<String, dynamic>',
      () async {
    // arrange
    when(
      dioOperations.post(body: body),
    ).thenAnswer(
      (_) async => gptResponse,
    );

    // act
    final response = await dioOperations.post(body: body);

    // assert
    expect(
      gptResponse,
      response,
    );
  });
}
