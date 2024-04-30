import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiServices {
  Dio dio = Dio();
  static String get baseUrl => 'https://api.github.com';

  ApiServices() {
    // dio.options.baseUrl = baseUrl;
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
    ));
  }
  Future<Response> dioGet({required String url, String? token}) async {
    dio.options = BaseOptions(
      receiveDataWhenStatusError: true,
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60),
      contentType: "application/x-www-form-urlencoded",
      responseType: ResponseType.json,
      extra: <String, dynamic>{
        "Access-Control-Allow-Methods": "POST, OPTIONS, GET, PUT, DELETE",
      },
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        token != null ? 'Authorization' : 'Bearer $token': null
      },
    );
    return await dio.get(url);
  }

  Future<Response> dioPost({
    required String url,
    required dynamic data,
    String? token,
  }) async {
    try {
      dio.options = BaseOptions(
        receiveDataWhenStatusError: true,
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
        connectTimeout: const Duration(seconds: 60),
        contentType: "application/x-www-form-urlencoded",
        responseType: ResponseType.json,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $token',
        },
      );
      final response = await dio.post(
        url,
        data: data,
      );
      return response;
    } catch (e) {
      throw Exception('Failed to perform POST request: $e');
    }
  }
}
