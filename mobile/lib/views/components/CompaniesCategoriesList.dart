import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/views/components/SchimmerText.dart';
import 'package:mobile/views/utils/MyColors.dart';
import 'package:shimmer/shimmer.dart';

class CompaniesCategoriesList extends StatelessWidget {
  final List<Widget> categoryItens;


  CompaniesCategoriesList(this.categoryItens);

  _shimmer(){
    List<Widget> children = [];
    final categoryShimmer = Column(
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: Container(
              margin: EdgeInsets.all(10),
              color: Colors.grey,
            ),
          ),
        ),

       SchimmerText(width : 80)
        
      ]
    );

    for(int i=0; i < 8; i++)
      children.add(categoryShimmer);
    
    return children;
  }

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
            child: Row(children : categoryItens.isNotEmpty ? categoryItens : _shimmer())
          ),
        )
        
      ],
    );
    
    
  }
}
