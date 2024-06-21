import 'package:dio/dio.dart';

class ProductService {
  Future<List> get() async {
    var response = await Dio().get('https://minicommerce.fly.dev/api/products',
        options: Options(headers: {
          "Content-Type": "application/json",
        }));

    return response.data;
  }

  Future<Map> getById(String id) async {
    var response = await Dio().get(
        'https://minicommerce.fly.dev/api/list-products/detail-product/$id',
        options: Options(headers: {
          "Content-Type": "application/json",
        }));

    return response.data;
  }
}
