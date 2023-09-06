/// Decode API response
final class ApiResponseModel {
  String getResponse({required Map<String, dynamic> response}) {
    try {
      final responseJson = response['choices'];
      final message = responseJson.first['message']['content'] as String;

      return message;
    } catch (e) {
      rethrow;
    }
  }
}
