import 'package:shamo_frontend/models/category_model.dart';
import 'package:shamo_frontend/models/gallery_model.dart';

class ProductModel {
  int? id;
  String? name;
  double? price;
  String? description;
  String? tags;
  CategoryModel? category;
  List<GalleryModel>? galleries;
  DateTime? createdAt;
  DateTime? updatedAt;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.tags,
    this.category,
    this.galleries,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: double.parse(json['price'].toString()),
      description: json['description'],
      tags: json['tags'],
      category: json['category'] != null ? CategoryModel.fromJson(json['category']) : null,
      galleries: json['galleries'] != null ? json['galleries'].map((gallery) => GalleryModel.fromJson(gallery)).toList() : [],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'tags': tags,
      'category': category?.toJson(),
      'galleries': galleries?.map((gallery) => gallery.toJson()).toList(),
      'created_at': createdAt?.toString(),
      'updated_at': updatedAt?.toString(),
    };
  }
}
