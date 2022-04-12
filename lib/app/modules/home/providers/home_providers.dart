import 'package:dio/dio.dart';

class HomeProviders {
  static const baseUrl = "https://www.tracktechsolutions.com/api/";

  Future<void> updateOrderStatus(Map<String, dynamic> data) async {
    try {
      Dio dio = Dio();
      await dio.post(baseUrl, data: data);
    } catch (e) {
      rethrow;
    }
  }
}
