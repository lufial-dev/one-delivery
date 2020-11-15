import 'package:flutter/cupertino.dart';
import 'package:mobile/models/CompanyCategory.dart';
import 'package:mobile/views/components/CategoryItem.dart';

class OneDeliveryController{

  Future<List<Widget>> allCategories() async {

    List<Widget> childrens = [];
    List<CompanyCategory> companyCategories = await CompanyCategory.all();
    if(companyCategories.isNotEmpty){
      companyCategories.forEach((item) => childrens.add(CategoryItem(name : item.name, icon: item.icon)));
    }else{
      childrens.add(Container());
    }

    return childrens;

  }

}