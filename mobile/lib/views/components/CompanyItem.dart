import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/models/Company.dart';
import 'package:mobile/views/components/Pointer.dart';
import 'package:mobile/views/utils/MyColors.dart';

class CompanyItem extends StatelessWidget {
  final Company company;
  CompanyItem(this.company);

  @override
  Widget build(BuildContext context) {

    double height = 60;
    double widthAvatar = 70;
    double widthStatus = 60;

    TextStyle styleTitle = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
    TextStyle styleValueDelivery = TextStyle(color: MyColors.SECONDARY);
    TextStyle styleScore = TextStyle(color: MyColors.PRIMARY, fontWeight: FontWeight.bold);
    TextStyle styleIsOpen = TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: MyColors.SECONDARY);
    TextStyle styleIsNotOpen = TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.grey);
    
    double margin = 5;

    return Card(
      shadowColor: MyColors.PRIMARY,
      child: Container(
        width: MediaQuery.of(context).size.width-20,
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              width: widthAvatar,
              height: height,
              child:CircleAvatar(
                radius: 34,
                backgroundImage: NetworkImage(company.image),

              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              width: MediaQuery.of(context).size.width-60-widthAvatar-widthStatus,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(company.name, style: styleTitle),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: margin, top: margin),
                        child: Text(company.timeDelivery),
                      ),
                      Pointer(),
                      Container(
                        margin: EdgeInsets.only(right: margin, top: margin),
                        child: 
                          Text(company.valueDelivery == 0 ?
                             "Grátis" :
                             "R\$${company.valueDelivery}", style: styleValueDelivery), 
                      )
                    ],
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text("5,0", style: styleScore,),
                        Icon(Icons.star, size: 20, color: MyColors.PRIMARY,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: widthStatus,
              height: height,
              alignment: Alignment.bottomRight,
              child: Text("Aberto", style: styleIsOpen),
            )
            
          ],
        ),
      ),     
    );
  }
}