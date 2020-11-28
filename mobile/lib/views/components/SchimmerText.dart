import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SchimmerText extends StatelessWidget {
  final double width;
  
  SchimmerText({this.width});
  
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: width,
      height: 10,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          color: Colors.grey,
        ),
      ),
    );
  }
}