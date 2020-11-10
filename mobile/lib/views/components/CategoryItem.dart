import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/views/utils/MyColors.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final String icon;

  CategoryItem({this.name, this.icon});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
          decoration: BoxDecoration(
            border: Border.all(
              color: MyColors.PRIMARY,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(100),
            
          ),

          child: Image.network(
            this.icon,
            width: 32,
            height: 32,
          )

        ),

        Text(
          this.name,
          style: TextStyle(
            color: MyColors.PRIMARY
          ),
        ),
      ]
    );
  }
}