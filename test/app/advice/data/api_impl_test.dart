import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sophis/app/advice/data/api_data_source.dart';
import 'package:sophis/app/advice/data/dio_client.dart';

import '../../../constants/api_response.dart';
import 'api_impl_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio dio;
  late DioClient dioClient;
  late ApiDataSource apiDataSource;

  setUp(() {
    dio = MockDio();
    dioClient = DioClient(dio);
    apiDataSource = ApiDataSource(dioClient);
  });

  const testBody = {'a': 'a'};
  const expectedResponse = gptResponse;

  test('Should receive a JSON from request', () async {
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

    // assert
    expect(result.data, expectedResponse);
  });
}
