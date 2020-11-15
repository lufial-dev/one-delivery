import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/views/utils/MyColors.dart';

class CompaniesCategoriesList extends StatelessWidget {
  final List<Widget> categoryItens;


  CompaniesCategoriesList(this.categoryItens);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container( 
          width: width,
          height: 50,
          decoration: BoxDecoration(
            color: MyColors.PRIMARY,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )
          ),
        ),
        Container(
          color: Colors.transparent,
          margin: EdgeInsets.only(top: 5, left: 10, right: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: categoryItens)
          ),
        )
        
      ],
    );
    
    
  }
}
