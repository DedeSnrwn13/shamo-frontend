import 'package:flutter/material.dart';
import 'package:shamo_frontend/models/product_model.dart';
import 'package:shamo_frontend/models/user_model.dart';
import 'package:shamo_frontend/services/auth_service.dart';
import 'package:shamo_frontend/services/product_service.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  set products(List<ProductModel> products) {
    _products = products;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<ProductModel> products = await ProductService().getProducts();

      _products = products;
    } catch (e) {
      print(e);
    }
  }
}
