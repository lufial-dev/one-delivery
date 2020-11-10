import 'package:flutter/cupertino.dart';
import 'package:mobile/models/Company.dart';
import 'package:mobile/views/components/CompaniesCategoriesList.dart';
import 'package:mobile/views/components/CompanyItem.dart';
import 'package:mobile/views/components/ProductsScrollList.dart';
import 'package:mobile/views/components/TitleList.dart';

class OneDeliveryPage extends StatefulWidget {
  @override
  _OneDeliveryPageState createState() => _OneDeliveryPageState();
}

class _OneDeliveryPageState extends State<OneDeliveryPage> {
  @override
  Widget build(BuildContext context) {
    Company company = Company();
    company.name="Burger King";
    company.score=5.0;
    company.valueDelivery = 0;
    company.timeDelivery = "25-30min";
    company.image = "https://thumbs.dreamstime.com/b/logotipo-de-burger-king-124289810.jpg";

    List<CompanyItem> companies = [
      CompanyItem(company),
      CompanyItem(company),
      CompanyItem(company),
      CompanyItem(company),
    ];
    
    return SingleChildScrollView(    
      child:Column(
        children: [
          CompaniesCategoriesList(),
          TitleList("Produtos"),
          ProductsScrollList(),
          TitleList("Lojas"),
          Container( 
            margin: EdgeInsets.all(10),
            child: Column(children: companies)
          ),
        ],
      ),
    );
  }
}