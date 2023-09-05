import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final class DioProvider {
  static const _url = 'https://api.openai.com/v1/chat';

  static final String _apiKey = dotenv.env['OPENAI_API_KEY']!;

  static final Map<String, String> _headers = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer $_apiKey',
  };

  static final Dio _dio = Dio();

  static Dio client() {
    final baseOptions = BaseOptions(
      baseUrl: _url,
      headers: _headers,
    );

    _dio.options = baseOptions;

    return _dio;
  }
}

final class ApiDataSource {
  static final _dio = DioProvider.client();

  static const _endpoint = '/completions';

  Future<Response<Map<String, dynamic>>> postRequest({
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        _endpoint,
        data: body,
      );

      if (response.statusCode != 200) {
        throw Exception();
      }

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
