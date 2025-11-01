import 'dart:convert';

import 'package:shamo_frontend/models/cart_model.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  static const String baseUrl = 'http://127.0.0.1:8000/api';

  Future<bool> checkout(
    String token,
    List<CartModel> carts,
    double totalPrice,
  ) async {
    var url = '$baseUrl/checkout';
    var headers = {
      'Content-Type': 'aplication/json',
      'Authorization': token,
    };
    var body = jsonEncode({
      'address': 'Sentul',
      'items': carts
          .map(
            (cart) => {
              'id': cart.id,
              'quantity': cart.quantity,
            },
          )
          .toList(),
      'status': 'PENDING',
      'total_price': totalPrice,
      'shipping_price': 0,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to checkout');
    }
  }
}
