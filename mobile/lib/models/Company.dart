import 'dart:convert';

import 'package:mobile/models/CompanyCategory.dart';
import 'package:mobile/models/Product.dart';
import 'package:mobile/services/api.dart';

class Company{
  String id;
  String name;
  String image;
  String coverImage;
  bool closedManually;
  double minValue;
  double score;
  String timeDelivery;
  double valueDelivery;
  CompanyCategory companyCategory;
  List<Product> products;

  Company({
    this.id,
    this.name,
    this.image,
    this.coverImage, 
    this.closedManually, 
    this.minValue,
    this.score, 
    this.timeDelivery,
    this.valueDelivery,
    this.companyCategory,
    this.products  
  });

  static Company fromJson(json){
    return Company(
      id : json['_id'],
      name : json['name'],
      image : json['image'],
      coverImage : json['cover_image'],
      closedManually : json['close_manually'],
      minValue : json['min_value'],
      score : json['score'],
      timeDelivery : json['time_delivery'],
      valueDelivery : json['value_delivery'],
      companyCategory : json['company_category'],
      products: json['products'],
    );
  }

  static Future<Company> findByProduct(String productId) async {
    final response = await API.get("company/product/"+productId); 
    var result = jsonDecode(response.body);
    
    return Company.fromJson(result);
    
  }
  
}