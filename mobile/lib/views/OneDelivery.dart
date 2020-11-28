import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/controllers/OneDeliveryController.dart';
import 'package:mobile/models/Company.dart';
import 'package:mobile/models/OpenHour.dart';
import 'package:mobile/views/components/CompaniesCategoriesList.dart';
import 'package:mobile/views/components/CompanyItem.dart';
import 'package:mobile/views/components/ProductsScrollList.dart';
import 'package:mobile/views/components/TitleList.dart';

class OneDeliveryPage extends StatefulWidget {
  @override
  _OneDeliveryPageState createState() => _OneDeliveryPageState();
}

class _OneDeliveryPageState extends State<OneDeliveryPage> {
  OneDeliveryController oneDeliveryController = OneDeliveryController();
  List<Widget> categories = [];
  List<Widget> products = [];

  Future<void> _loadData() async {
      setState(() {
        categories = [];
        products = [];
      });
      
      List<Widget> listCategories = await oneDeliveryController.allCategories();
      List<Widget> listProducts = await oneDeliveryController.allproducts();
      setState(() {
        categories = listCategories;
        products = listProducts;
      });
  }

  @override
  void initState() {
    super.initState();
     _loadData();
  }

  @override
  Widget build(BuildContext context) {
    OpenHour openHour = OpenHour();
    openHour.dayOfWeek = 2;
    openHour.openMorning = DateTime(0, 0, 0, 8, 30, 0, 0, 0);
    openHour.closeMorning = DateTime(0, 0, 0, 11, 30, 0, 0, 0);

    openHour.openEvening = DateTime(0, 0, 0, 0, 0, 0, 0, 0);
    openHour.closeEvening = DateTime(0, 0, 0, 0, 0, 0, 0, 0);

    openHour.openNight = DateTime(0, 0, 0, 11, 30, 0, 0, 0);
    openHour.closeNight = DateTime(0, 0, 0, 22, 30, 0, 0, 0);

    Company company = Company();
    company.name="Burger King";
    company.score=5.5;
    company.valueDelivery = 10;
    company.timeDelivery = "25-30min";
    company.image = "https://thumbs.dreamstime.com/b/logotipo-de-burger-king-124289810.jpg";



    List<CompanyItem> companies = [
      CompanyItem(company, openHour),
      CompanyItem(company, openHour),
      CompanyItem(company, openHour),
      CompanyItem(company, openHour),
      CompanyItem(company, openHour),
    ];
    
    return RefreshIndicator(
      onRefresh: _loadData,
        child: Column(
          children: [
            CompaniesCategoriesList(categories),
            Expanded(
              child: SingleChildScrollView(   
                child:Column(
                  children: [
                    TitleList("Produtos"),
                    ProductsScrollList(products),
                    TitleList("Lojas"),
                    Container( 
                      margin: EdgeInsets.all(10),
                      child: Column(children: companies)
                    ),
                  ],
                ),
              ),
            ),
          ],
      ),
    );
  }
}
