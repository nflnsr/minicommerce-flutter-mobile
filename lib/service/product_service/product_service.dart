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

  Future<Map> add({
    required productName,
    required typeProduct,
    required desc,
    required price,
    required location,
    required stock,
    required sold,
    required imgProduct,
  }) async {
    var formData = FormData.fromMap({
      "product_name": productName,
      "type_product": typeProduct,
      "desc": desc,
      "price": price,
      "location": location,
      "stock": stock,
      "sold": sold,
      "img_product": imgProduct != null
          ? await MultipartFile.fromFile(imgProduct.path,
              filename: "upload.jpg")
          : null,
    });
    try {
      var response = await Dio().post(
        'https://minicommerce.fly.dev/api/products',
        data: formData,
        // options: Options(headers: {
        //   "Content-Type": "multipart/form-data",
        // }),
      );
      response.data["message"] = "success";
      print("responnyaaa $response");
      print(response.data);
      return response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          return {"message": "failed"};
        } else {
          print('Error ${e.response!.statusCode}: ${e.response!.data}');
          return {"message": "failed"};
        }
      } else {
        print('Error sending request: ${e.message}');
        return {"message": "failed"};
      }
    }
  }

  Future<Map> delete(String id) async {
    try {
      var response = await Dio().delete(
        'https://minicommerce.fly.dev/api/products/$id',
        options: Options(headers: {
          "Content-Type": "application/json",
        }),
      );
      response.data["message"] = "success";
      return response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          return {"message": "failed"};
        } else {
          print('Error ${e.response!.statusCode}: ${e.response!.data}');
          return {"message": "failed"};
        }
      } else {
        print('Error sending request: ${e.message}');
        return {"message": "failed"};
      }
    }
  }
  
}
