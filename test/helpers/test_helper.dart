import 'package:mockito/annotations.dart';
import 'package:sophis/app/advice/data/dio_client.dart';
import 'package:sophis/app/advice/domain/api.dart';
import 'package:sophis/app/saved_advices/presenter/controller/saved_advice_controller.dart';

@GenerateMocks(
  [
    ApiRepository,
    DioOperations,
    SavedAdviceInteractions,
  ],
)
void main() {}
