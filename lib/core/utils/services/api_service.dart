import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<Map<String, dynamic>> get({required String url}) async {
    var response = await dio.get(url);
    return response.data;
  }
}
