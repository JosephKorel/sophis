import 'package:dio/dio.dart';
import 'package:flutter_animate/flutter_animate.dart';

final class DioClient {
  DioClient(this._dio);
  final Dio _dio;

  static const _url = 'https://api.openai.com/v1/chat';

  static const _endpoint = '/completions';

  // static final String _apiKey = dotenv.env['OPENAI_API_KEY']!;

  static const String _apiKey = '123123123';

  static final Map<String, String> _headers = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer $_apiKey',
  };

  final _baseOptions = BaseOptions(
    baseUrl: _url,
    headers: _headers,
    connectTimeout: 8.seconds,
  );

  Future<Response<Map<String, dynamic>>> postRequest({
    required Map<String, dynamic> body,
  }) async {
    _dio.options = _baseOptions;

    try {
      final response =
          await _dio.post<Map<String, dynamic>>(_endpoint, data: body);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
