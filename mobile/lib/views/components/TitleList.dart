import 'package:flutter/cupertino.dart';

class TitleList extends StatelessWidget {
  final String title;
  TitleList(this.title);

  final TextStyle styleTitle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(20),
      child: Text(title, style: styleTitle,),
    );
  }
}