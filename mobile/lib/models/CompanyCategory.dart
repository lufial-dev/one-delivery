import 'dart:convert';

import 'package:mobile/services/api.dart';

class CompanyCategory {
  String id;
  String name;
  String icon;

  CompanyCategory({ this.id, this.name, this.icon });

  factory CompanyCategory.fromJson(Map<String , dynamic> json){
    return CompanyCategory(
      id: json['_id'],
      name: json['name'],
      icon: json['icon']
    );
  }

  static Future<List<CompanyCategory>> all() async {
    List<CompanyCategory> list = [];

    final response = await API.fetchArray("companycategory/all");
      List result = jsonDecode(response.body);
      result
          .forEach((item) async => list.add(CompanyCategory.fromJson(item)));
    return list;

  }
}