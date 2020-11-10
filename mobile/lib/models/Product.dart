import 'package:mobile/models/Company.dart';
import 'package:mobile/models/Ingredient.dart';

class Product{
  int id;
  String name;
  String description;
  double value;
  Company company;
  List<Ingredient> ingredients;
}