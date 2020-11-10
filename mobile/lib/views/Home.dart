import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/views/OneDelivery.dart';
import 'package:mobile/views/Search.dart';
import 'package:mobile/views/utils/MyColors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  List<Widget> titles = [
    Text("1 Delivery"),
    Text("Meus Pedidos"),
    Text("Meu Carrinho"),
    Text("Configurações"),
  ];

  List<Widget> pages = [
    OneDeliveryPage(),
    Text("Pedidos"),
    Text("Carrinho"),
    Text("Configurações"),
  ];

  _pressedSearch(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPage()));
  }

  @override
  Widget build(BuildContext context) {

    
    AppBar appBar = AppBar(
      title: titles[_currentIndex],
      actions: [
        _currentIndex == 0 ? IconButton(
          icon: Icon(Icons.search),
          onPressed: _pressedSearch,
        ) : Text(""),
      ],
    ); 

    

    BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
      selectedItemColor: MyColors.PRIMARY,
      type: BottomNavigationBarType.fixed,
      elevation: 10,
      currentIndex: _currentIndex,
      onTap: (_index){
        setState(() {
          _currentIndex = _index;
        });
      },
      items: [
        BottomNavigationBarItem(
           icon: Icon(Icons.home),
           title: Text("Home")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.content_paste),
          title: Text("Pedidos")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          title: Text("Carrinho") 
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text("Configurações")
        )
      ],
    );


    return Scaffold(
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      body: pages[_currentIndex],

    );
  }
}

