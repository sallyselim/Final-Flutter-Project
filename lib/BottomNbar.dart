import 'package:flutter/material.dart';
import 'file:///D:/Dart%20Programming%20-%20Data%20Types%20-%20Tutorialspoint_files/p1/flutter_appfinal/lib/Acategories/AllCategories.dart';
import 'file:///D:/Dart%20Programming%20-%20Data%20Types%20-%20Tutorialspoint_files/p1/flutter_appfinal/lib/AProoducts/AllProducts.dart';
import 'package:flutter_appfinal/Home.dart';
import 'package:flutter_appfinal/Menu.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  List<Widget> _widgetScreen = <Widget>[
    Wellcome(),
    AllCategories(),
    AllProducts(),
    Menu(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.greenAccent,
        child: _widgetScreen.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green[900],
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.green[100]),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_tree),
              label: "categories",
              backgroundColor: Colors.green[100]),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_to_photos_outlined),
              label: "products",
              backgroundColor: Colors.green[100]),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_outlined),
              label: "menu",
              backgroundColor: Colors.green[100]),
        ],
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}
