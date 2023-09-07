import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class DioOperations {
  Future<Map<String, dynamic>> post({
    required Map<String, dynamic> body,
  });
}

final class DioConfig {
  static const _url = 'https://api.openai.com/v1/chat';

  static final String _apiKey = dotenv.env['OPENAI_API_KEY']!;

  static final Map<String, String> _headers = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer $_apiKey',
  };

  static BaseOptions baseOptions() {
    return BaseOptions(
      baseUrl: _url,
      headers: _headers,
    );
  }
}

final class DioImplementation extends DioOperations {
  DioImplementation(this._dio);

  final Dio _dio;

  static const _endpoint = '/completions';

  @override
  Future<Map<String, dynamic>> post({
    required Map<String, dynamic> body,
  }) async {
    try {
      _dio.options = DioConfig.baseOptions();

      final result = await _dio.post<Map<String, dynamic>>(
        _endpoint,
        data: body,
        onReceiveProgress: (count, total) {
          debugPrint('ESTE ÉO COUNT');
          debugPrint(count.toString());
        },
      );

      if (result.statusCode != 200) {
        throw Exception();
      }

      return result.data!;
    } catch (e) {
      rethrow;
    }
  }
}
