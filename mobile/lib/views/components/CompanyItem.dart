import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/models/Company.dart';
import 'package:mobile/models/OpenHour.dart';
import 'package:mobile/views/components/Pointer.dart';
import 'package:mobile/views/utils/MyColors.dart';
import 'package:intl/intl.dart';

class CompanyItem extends StatelessWidget {
  final Company company;
  final OpenHour openHour;
  final DateTime today = DateTime.now();
  final DateFormat format = DateFormat("HH:mm");
  final NumberFormat valueFormat = NumberFormat("##.00", "pt-BR");
  final NumberFormat scoreFormat = NumberFormat("#.0", "pt-BR");
  
  CompanyItem(this.company, this.openHour);
  

  bool _isOpen(){
    if(
      _isOpenPerShift(openHour.openMorning, openHour.closeMorning) ||
      _isOpenPerShift(openHour.openEvening, openHour.closeEvening) ||
      _isOpenPerShift(openHour.openNight, openHour.closeNight)
      )
      return true;
    return false;
  }

  bool _isOpenPerShift(DateTime openHour, DateTime closeHour){
    if(openHour != null && closeHour != null)
      if(_compareHour(openHour, today) && _compareHour(today, closeHour))
        return true;
    return false;
  }

  bool _compareHour( DateTime primaryHour, DateTime secondaryHour ){
    DateTime primary = DateTime(0,0,0, primaryHour.hour, primaryHour.minute,0,0);
    DateTime secondary = DateTime(0,0,0, secondaryHour.hour, secondaryHour.minute,0,0);

    if(primary.isBefore(secondary)){
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {

    double height = 60;
    double widthAvatar = 70;
    double widthStatus = 80;

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
                             "R\$${valueFormat.format(company.valueDelivery)}", style: styleValueDelivery), 
                      )
                    ],
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text("${scoreFormat.format(company.score)}", style: styleScore,),
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
              child: _isOpen() ? 
                Text("Aberto", style: styleIsOpen) :
                Text("Fechado", style: styleIsNotOpen)
            )
            
          ],
        ),
      ),     
    );
  }


}