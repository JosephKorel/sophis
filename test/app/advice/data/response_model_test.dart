import 'package:flutter_test/flutter_test.dart';
import 'package:sophis/app/advice/data/response_model.dart';

import '../../../constants/api_response.dart';

void main() {
  const responseAdvice = 'This is a test';

  test('Should get a string from gpt mock response', () {
    const apiResponseModel = ApiResponseModel.instance;

    final result = apiResponseModel.getResponse(response: gptResponse);

    expect(result, responseAdvice);
  });
}
