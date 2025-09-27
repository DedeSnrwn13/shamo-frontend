import 'package:shamo_frontend/models/product_model.dart';

class CartModel {
  int? id;
  ProductModel? product;
  int? quantity;

  CartModel({
    this.id,
    this.product,
    this.quantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      product: json['product'] != null ? ProductModel.fromJson(json['product']) : null,
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product?.toJson(),
      'quantity': quantity,
    };
  }

  double get totalPrice => quantity != null && product != null ? quantity! * product!.price! : 0;
}
