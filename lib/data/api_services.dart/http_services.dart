import 'package:dio/dio.dart';

class HttpServices {
  HttpServices();
  final _dio = Dio();
  Future<Response?> get(String path) async {
    try {
      final response = await _dio.get(path);
      return response;
    } catch (e) {
      print("Error is: $e");
      return null;
    }
  }
}
