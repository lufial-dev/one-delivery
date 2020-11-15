import 'package:mobile/models/Company.dart';
import 'package:mobile/models/Ingredient.dart';

class Product{
  String id;
  String name;
  String description;
  double value;
  Company company;
  List<Ingredient> ingredients;
}