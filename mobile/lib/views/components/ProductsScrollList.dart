import 'package:flutter/cupertino.dart';
import 'package:mobile/models/Company.dart';
import 'package:mobile/models/Product.dart';
import 'package:mobile/views/components/ProductItem.dart';

class ProductsScrollList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Company company = Company();
    company.name="Hamburgueria";
    company.score=5.0;
    company.valueDelivery = 0;
    company.timeDelivery = "25-30min";
    Product product = Product();
    product.name="Hamburger";
    product.value = 17.00;
    product.company = company;

    List<ProductItem> products = [
    ProductItem(product),
    ProductItem(product),
    ProductItem(product)
  ];
  
    return Container( 
      margin: EdgeInsets.all(10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: products)
      )
    );
  }
}