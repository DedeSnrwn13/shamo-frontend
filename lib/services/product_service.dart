import 'dart:convert';

import 'package:shamo_frontend/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static const String baseUrl = 'http://127.0.0.1:8000/api';

  Future<List<ProductModel>> getProducts() async {
    var url = '$baseUrl/products';
    var headers = {
      'Content-Type': 'application/json',
      'Keep-Alive': "timeout=5, max=1",
    };
    var response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ProductModel> products = [];

      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }

      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
