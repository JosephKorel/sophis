void main() {
  /*  late MockDio dio;
  late ApiDataSource dioClient;

  setUp(() {
    dio = MockDio();
    dioClient = ApiDataSource();
  });

  const testBody = {'a': 'a'};
  const expectedResponse = gptResponse;

  group('Test dio post request and parse response', () {
    test('Should receive a JSON from request', () async {
      // arrange
      when(
        dioClient.postRequest(body: testBody),
      ).thenAnswer(
        (_) async => Response(
          statusCode: 200,
          data: expectedResponse,
          requestOptions:
              RequestOptions(path: 'https://api.openai.com/v1/chat/endpoint'),
        ),
      );

      // act
      final result = await dioClient.postRequest(body: testBody);

      // assert
      expect(result.data, expectedResponse);
    });

    test('Should receive a string from JSON response', () async {
      const apiResponseModel = ApiResponseModel.instance;

      const responseAdvice = 'This is a test';

      // arrange
      when(
        dioClient.postRequest(body: testBody),
      ).thenAnswer(
        (realInvocation) async => Response(
          statusCode: 200,
          data: expectedResponse,
          requestOptions:
              RequestOptions(path: 'https://api.openai.com/v1/chat/endpoint'),
        ),
      );

      // act
      final result = await dioClient.postRequest(body: testBody);
      final data = result.data!;
      final advice = apiResponseModel.getResponse(response: data);

      // assert
      expect(advice, responseAdvice);
    });
  }); */
}
