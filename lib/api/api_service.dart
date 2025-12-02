import 'package:brewy_app/api/api_url.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiUrl.baseUrl,
      connectTimeout: Duration(seconds: 15),
      receiveTimeout: Duration(seconds: 15),
    ),
  );
  Future<Response?> getData(String endpoint) async {
    try {
      Response response = await _dio.get(endpoint);
      return response;
    } catch (e) {
      print("GET API Error: $e");
      return null;
    }
  }
}
