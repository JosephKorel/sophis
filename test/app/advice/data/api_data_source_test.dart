import 'package:flutter_test/flutter_test.dart';
import 'package:sophis/app/advice/data/api_impl.dart';
import 'package:sophis/app/advice/data/dio_client.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late DioMockClient dio;
  late DioClient dioClient;
  late ApiRepositoryImpl apiRepositoryImpl;

  setUp(() {
    dio = DioMockClient();
    dioClient = DioClient(dio);
    apiRepositoryImpl = ApiRepositoryImpl(dioClient);
  });
}
