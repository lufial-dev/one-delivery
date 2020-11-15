import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/views/utils/MyColors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final String icon;

  CategoryItem({this.name, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(13),
              child: SvgPicture.network(
                this.icon,
                color: MyColors.PRIMARY,
                width: 32,
                height: 32
              ),
            )
          ),

          Container(
            child: Text(
              this.name,
              softWrap: false,
              style: TextStyle(
                color: MyColors.PRIMARY,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ]
      ),
    );
  }
}