import 'package:sophis/app/advice/data/dio_client.dart';

final class ApiDataSource {
  ApiDataSource(this._dioClient);

  final DioClient _dioClient;

  Future<Map<String, dynamic>> postRequest({
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await _dioClient.postRequest(body: body);

      return response.data!;
    } catch (e) {
      rethrow;
    }
  }
}
