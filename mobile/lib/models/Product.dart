import 'dart:convert';

import 'package:mobile/models/Ingredient.dart';
import 'package:mobile/models/ProductImage.dart';
import 'package:mobile/services/api.dart';

class Product{
  String id;
  String name;
  String description;
  double value;
  List<Ingredient> ingredients;
  List<ProductImage> images;

  Product({this.id, this.name, this.description, this.value, this.ingredients, this.images});

  static Product fromJson(json) {
    return Product(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      value: double.parse(json['value'].toString()),
      ingredients: Ingredient.listFromJson(json['ingredients']),
      images: ProductImage.listFromJson(json['images'])
    );
  }

  static Future<List<Product>> count(int count) async {
    List<Product> list = [];
    final response = await API.get("product/count/"+count.toString()); 
     List result = jsonDecode(response.body);
      result
          .forEach((item)=> list.add(Product.fromJson(item)));
    return list;

  }

}

