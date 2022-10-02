//@dart=2.9

import 'package:makaroniyeh/models/categorymodel.dart';

class ProductModel {
  int id;
  String name;
  int category_id;
  String desc;
  int price;
  String image;
  CategoryModel category;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    category_id = json["category_id"];
    desc = json["desc"];
    price = json["price"];
    image = json["image"];
    category = CategoryModel.fromJson(json["category"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id" : id,
      "name" : name,
      "category_id" : category_id,
      "desc" : desc,
      "price" : price,
      "image": image,
      "category": category.toJson(),
    };
  }
}