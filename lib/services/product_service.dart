import 'dart:convert';

import 'package:shamo_frontend/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static const String baseUrl = 'http://50.0.43.45:8000/api';

  Future<List<ProductModel>> getProducts() async {
    var url = '$baseUrl/products';
    var headers = {
      'Content-Type': 'application/json',
    };
    var response = await http.get(Uri.parse(url), headers: headers);

    print(response.body);

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
