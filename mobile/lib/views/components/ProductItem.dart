import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/models/Product.dart';
import 'package:mobile/views/utils/MyColors.dart';
import 'package:intl/intl.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    double width = 120;
    final NumberFormat valueFormat = NumberFormat("##.00", "pt-BR");

    TextStyle styleValue = TextStyle(color: MyColors.PRIMARY, fontWeight: FontWeight.bold);
    TextStyle styleProduct = TextStyle(color: Colors.grey);
    TextStyle styleCompany = TextStyle(fontWeight: FontWeight.bold);

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
                      child:Text(product.company.name,
                        style: styleCompany,
                      ),
                    ),
                    Container(
                      width: width,
                      child:Text(product.name,
                        style: styleProduct,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      width: width,
                      child: Text("R\$${valueFormat.format(product.value)}",
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
                backgroundImage:  NetworkImage("https://conteudo.imguol.com.br/c/entretenimento/71/2020/05/27/guia-do-hamburguer---sanduiche-1590607899872_v2_450x337.jpg",),      
                radius: 34,
              ),
            ),
          ),
      ],),      
    );
  }
}