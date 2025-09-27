import 'package:flutter/material.dart';
import 'package:shamo_frontend/models/cart_model.dart';
import 'package:shamo_frontend/models/product_model.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> _carts = [];

  List<CartModel> get carts => _carts;

  set cart(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  addCart(ProductModel product) {
    if (productExist(product)) {
      int index = _carts.indexWhere((element) => element.product?.id == product.id);
      _carts[index].quantity = _carts[index].quantity! + 1;
    } else {
      _carts.add(
        CartModel(
          id: _carts.length,
          product: product,
          quantity: 1,
        ),
      );
    }

    notifyListeners();
  }

  removeCart(int id) {
    int index = _carts.indexWhere((element) => element.id == id);

    if (index != -1) {
      _carts.removeAt(index);
      notifyListeners();
    }
  }

  addQuantity(int id) {
    int index = _carts.indexWhere((element) => element.id == id);

    if (index != -1) {
      _carts[index].quantity = _carts[index].quantity! + 1;
      notifyListeners();
    }
  }

  reduceQuantity(int id) {
    int index = _carts.indexWhere((element) => element.id == id);

    if (index != -1) {
      _carts[index].quantity = _carts[index].quantity! - 1;
      if (_carts[index].quantity == 0) {
        _carts.removeAt(index);
      }
      notifyListeners();
    }
  }

  totalItems() {
    int total = 0;

    for (var item in _carts) {
      total += item.quantity!;
    }

    return total;
  }

  totalPrice() {
    double total = 0;

    for (var item in _carts) {
      total += (item.quantity ?? 0) * (item.product?.price ?? 0);
    }

    return total;
  }

  productExist(ProductModel product) {
    if (_carts.indexWhere((element) => element.product?.id == product.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
