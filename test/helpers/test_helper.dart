import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:sophis/app/advice/domain/api.dart';

@GenerateMocks(
  [
    ApiRepository,
  ],
  customMocks: [MockSpec<Dio>(as: #DioMockClient)],
)
void main() {}
