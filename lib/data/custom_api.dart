import 'package:http/http.dart' as http;

import 'api_constant.dart';

abstract class CustomAPI {
  static Future<http.Response> apiGet({
    required String url,
  }) async {
    return await http.get(
      Uri.parse(url),
      headers: {
        "Authorization": APIConstants.authorization,
      },
    );
  }
}
