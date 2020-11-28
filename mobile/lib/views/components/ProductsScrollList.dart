import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class ProductsScrollList extends StatelessWidget {
  final List<Widget> products;
  ProductsScrollList(this.products);

  _shimmer(){
    List<Widget> children = [];
    final productShimmer = SizedBox(
      width: 120,
      height: 120,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        child: Container(
          margin: EdgeInsets.all(10),
          color: Colors.grey,
        )
      ),

    );

    for(int i=0; i < 4; i++)
      children.add(productShimmer);
    
    return children;
  }

  @override
  Widget build(BuildContext context) {  
    return Container( 
      margin: EdgeInsets.all(10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: products.isNotEmpty ?  products : _shimmer())
      )
    );
  }
}