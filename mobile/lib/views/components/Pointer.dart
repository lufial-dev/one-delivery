import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pointer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4,
      height: 4,
      margin: EdgeInsets.only(right: 5, top: 5),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(),
      ),
    );

  }
}