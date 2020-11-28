import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/models/Company.dart';
import 'package:mobile/models/Product.dart';
import 'package:mobile/views/components/SchimmerText.dart';
import 'package:mobile/views/utils/MyColors.dart';
import 'package:intl/intl.dart';

class ProductItem extends StatefulWidget {
  final Product product;
  final Company company;
  ProductItem({this.product, this.company});
  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  double width = 120;
  final NumberFormat valueFormat = NumberFormat("##.00", "pt-BR");

  TextStyle styleValue = TextStyle(color: MyColors.PRIMARY, fontWeight: FontWeight.bold);
  TextStyle styleProduct = TextStyle(color: Colors.grey);
  TextStyle styleCompany = TextStyle(fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    print(widget.product.ingredients);
    return Container(
      child: Stack(
        children: [
          Container(
            width: width,
            margin: EdgeInsets.symmetric(horizontal: 5),
            padding: EdgeInsets.only(top: 34),
            child: Card(
              shadowColor: MyColors.PRIMARY,
              child:Padding(
                padding: EdgeInsets.only(top: 40, bottom: 10, left: 10, right: 10),
                child: Column(
                  children: [
                    Container(
                      width: width,
                      child:widget.company != null ? 
                        Text("${widget.company}",
                          style: styleCompany,
                        ) :
                        Align(
                          alignment: Alignment.topLeft,
                          child:SchimmerText(width: width,)
                        ),
                    ),
                    Container(
                      width: width,
                      child:Text(widget.product.name,
                        style: styleProduct,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      width: width,
                      child: Text("R\$${valueFormat.format(widget.product.value)}",
                        style: styleValue,
                        textAlign: TextAlign.end,
                      )
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: width,
            margin: EdgeInsets.symmetric(horizontal: 5),
            child:Center(
              child: CircleAvatar(
                backgroundImage:  NetworkImage("${widget.product.images[0].dir}"),      
                radius: 34,
                backgroundColor: Colors.grey[300],
              ),
            ),
          ),
      ],),      
    );
  }
}