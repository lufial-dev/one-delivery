import 'package:flutter/cupertino.dart';
import 'package:mobile/models/Company.dart';
import 'package:mobile/models/CompanyCategory.dart';
import 'package:mobile/models/Product.dart';
import 'package:mobile/views/components/CategoryItem.dart';
import 'package:mobile/views/components/ProductItem.dart';

class OneDeliveryController{

  Future<List<Widget>> allproducts() async {
    List<Widget> childrens = [];
    List<Product> products = await Product.count(10);
    if(products.isNotEmpty){
      products.forEach( (item) async => childrens.add(
        ProductItem(
          product : 
            Product(
              name: item.name,
              description: item.description, 
              value: item.value, 
              images: item.images, 
              ingredients: item.ingredients
            ),
          company: null // await Company.findByProduct(item.id),
        ),
      ));
    }
    return childrens;

  }

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