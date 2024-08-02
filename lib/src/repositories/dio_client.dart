import 'package:dio/dio.dart';
import 'package:treemap_challenge/src/interfaces/http_client.dart';

class DioClient extends HttpClient {
  Dio dio = Dio();
  @override
  Future<Response<dynamic>> get(String url) {
    return dio.get(url);
  }
}
