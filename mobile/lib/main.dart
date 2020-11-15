import 'package:flutter/material.dart';
import 'package:mobile/views/Home.dart';
import 'package:mobile/views/utils/MyColors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '1 Delivery',
      color: Colors.white,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: MyColors.PRIMARY,
          centerTitle: true,
        )
      ),
      home: HomePage(),
    );
  }
}
