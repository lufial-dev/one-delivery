import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/views/utils/MyColors.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  _pressedBack(){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    TextStyle styleTilteList = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold
    );

    Icon suffixIcon = Icon(
      Icons.search,
      color: MyColors.PRIMARY,
    );

    IconButton icon =  IconButton(
      icon: Icon(
          Icons.keyboard_arrow_left,
          color: Colors.black,
        ),
      onPressed: _pressedBack,
    );

    Widget fieldSearch = Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15)

      ),

      child: TextField(
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
          icon: icon,
          suffixIcon: suffixIcon,
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          hintText: "Buscar...",
        ),
      )
      
    );


    AppBar appBar = AppBar( 
      automaticallyImplyLeading: false,
      title: fieldSearch,
      elevation: 0
    );

    ListView contentList = ListView(
      children: [
        Text("Nenhum resultado encontrado...", style: styleTilteList,)
      ],
    );

    Widget body = Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.only(top: 20, left:20, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
            BoxShadow(
                color: Colors.black,
                blurRadius: 15.0,
                spreadRadius: 0.0,
                offset: Offset(2.0, 2.0), // shadow direction: bottom right
            )
        ],
      ),

      child: contentList,
    );

    return Scaffold(
      backgroundColor: MyColors.PRIMARY,
      appBar: appBar,
      body: body

    );
  }
}