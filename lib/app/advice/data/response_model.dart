/// Decode API response
final class ApiResponseModel {
  const ApiResponseModel._();

  static const instance = ApiResponseModel._();

  String getResponse({required Map<String, dynamic> response}) {
    try {
      // final responseBody = utf8.decode(response.data);

      /* final responseData = response.data as String;
      final responseJson = jsonDecode(responseData)['choices'];
      final message = responseJson.first['message']['content'] as String; */

      final responseJson = response['choices'];
      final message = responseJson.first['message']['content'] as String;

      return message;
    } catch (e) {
      rethrow;
    }
  }
}
