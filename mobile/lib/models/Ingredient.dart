import 'dart:convert';

import 'package:mobile/services/api.dart';

class Ingredient{
  String id;
  String name;
  double value;

  Ingredient({this.id, this.name, this.value});

  factory Ingredient.fromJson(Map<String, dynamic> json ){
    return Ingredient(
      id: json['_id'],
      name: json['name'],
      value: double.parse(json['value'].toString())
    );

  }

  static List<Ingredient> listFromJson(List json){
    List<Ingredient> ingredients = [];
    json.forEach((element) {
       ingredients.add(Ingredient.fromJson(element));
     });
    return ingredients;
  }

  static findById(String id) async {
    final response = await API.get("ingredient/id/"+id);        
      Map<String, dynamic> result = jsonDecode(response.body);
    return Ingredient.fromJson(result);

    
  }
}