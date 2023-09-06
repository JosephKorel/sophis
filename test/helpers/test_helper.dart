import 'package:mockito/annotations.dart';
import 'package:sophis/app/advice/data/data_source.dart';
import 'package:sophis/app/advice/data/dio_client.dart';
import 'package:sophis/app/advice/domain/api.dart';

@GenerateMocks(
  [
    ApiRepository,
    DataSourceRepository,
    DioOperations,
  ],
)
void main() {}
