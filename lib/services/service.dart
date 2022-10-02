//@dart=2.9

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:makaroniyeh/models/categorymodel.dart';
import 'package:makaroniyeh/models/productmodel.dart';
import 'package:makaroniyeh/shared/theme.dart';

class AllService {

  Future<List<CategoryModel>> getCategories() async {
    var url = "$baseUrl/categories";
    var header = {
      "Content-Type" : "application/json"
    };

    var response = await http.get(url, headers: header);
    List data = jsonDecode(response.body)["data"];
    List<CategoryModel> categories = [];
    for (var item in data) {
      categories.add(CategoryModel.fromJson(item));
    }
    return categories;
  }

  Future<List<ProductModel>> getBestSeller() async {
    var url = "$baseUrl/products/best";
    var header = {"Content-Type": "application/json"};

    var response = await http.get(url, headers: header);
    List data = jsonDecode(response.body)["data"];
    List<ProductModel> products = [];
    for (var item in data) {
      products.add(ProductModel.fromJson(item));
    }
    return products;
  }

  Future<List<ProductModel>> getSpecial() async {
    var url = "$baseUrl/products/special";
    var header = {"Content-Type": "application/json"};

    var response = await http.get(url, headers: header);
    List data = jsonDecode(response.body)["data"];
    List<ProductModel> products = [];
    for (var item in data) {
      products.add(ProductModel.fromJson(item));
    }
    return products;
  }

  Future<List<ProductModel>> getPopular() async {
    var url = "$baseUrl/products/popular";
    var header = {"Content-Type": "application/json"};

    var response = await http.get(url, headers: header);
    List data = jsonDecode(response.body)["data"];
    List<ProductModel> products = [];
    for (var item in data) {
      products.add(ProductModel.fromJson(item));
    }
    return products;
  }

  Future<List<ProductModel>> getAllProducts() async {
    var url = "$baseUrl/products";
    var header = {"Content-Type": "application/json"};

    var response = await http.get(url, headers: header);
    List data = jsonDecode(response.body)["data"];
    List<ProductModel> products = [];
    for (var item in data) {
      products.add(ProductModel.fromJson(item));
    }
    print(products);
    return products;
  }

  Future<List<ProductModel>> getProductsByCategory(int id) async {
    var url = "$baseUrl/products/$id";
    var header = {"Content-Type": "application/json"};

    var response = await http.get(url, headers: header);
    List data = jsonDecode(response.body)["data"];
    List<ProductModel> products = [];
    for (var item in data) {
      products.add(ProductModel.fromJson(item));
    }
    print(products);
    return products;
  }
}