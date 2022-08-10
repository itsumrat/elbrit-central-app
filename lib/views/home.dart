import 'package:elbrit_central/views/notification.dart';
import 'package:elbrit_central/views/price_list.dart';
import 'package:elbrit_central/views/products.dart';
import 'package:elbrit_central/views/wall.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    WallPage(),
    ProductPage(),
    PriceListPage(),
    NotificationPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/Vector-7.png',
              scale: 1.3,
            ),
            label: 'Wall',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/Vector-8.png',
              scale: 1.3,
            ),
            label: 'Products',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/Vector-9.png',
              scale: 1.3,
            ),
            label: 'Pricelist',
            // backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/Vector-10.png',
              scale: 1.3,
            ),
            label: 'Notification',
            // backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff18B7FF),
        unselectedItemColor: const Color(0xff191919),
        onTap: _onItemTapped,
      ),
    );
  }
}
