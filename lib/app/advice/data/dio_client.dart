import 'package:dio/dio.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final class DioClient {
  static const _url = 'https://api.openai.com/v1/chat';

  static final String _apiKey = dotenv.env['OPENAI_API_KEY']!;

  static final Map<String, String> _headers = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer $_apiKey',
  };

  final _baseOptions = BaseOptions(
    baseUrl: _url,
    headers: _headers,
    connectTimeout: 8.seconds,
  );

  Dio get client => Dio(_baseOptions);
}
