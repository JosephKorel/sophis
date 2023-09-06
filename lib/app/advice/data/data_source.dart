import 'package:sophis/app/advice/data/dio_client.dart';
import 'package:sophis/app/advice/data/response_model.dart';

abstract class DataSourceRepository {
  Future<String> postRequest({
    required Map<String, dynamic> body,
  });
}

final class DataSourceImpl extends DataSourceRepository {
  DataSourceImpl({required this.dio, required this.responseModel});

  final DioOperations dio;
  final ApiResponseModel responseModel;

  @override
  Future<String> postRequest({
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await dio.post(
        body: body,
      );

      return responseModel.getResponse(response: response);
    } catch (e) {
      rethrow;
    }
  }
}
