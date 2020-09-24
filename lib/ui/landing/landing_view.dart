import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/constant.dart';
import 'package:foodie/ui/account/account_view.dart';
import 'package:foodie/ui/home/home_view.dart';
import 'package:foodie/ui/inbox/inbox_view.dart';
import 'package:foodie/ui/map/map_view.dart';
import 'package:foodie/ui/order/order_view.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => new _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _bottomNavCurrentIndex = 0;
    List<Widget> _container = [
      HomePage(),
      OrderPage(),
      MapPage(),
      InboxPage(),
      AccountPage(),
  ];

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _container[_bottomNavCurrentIndex],
          _buildWhiteGradient(),
          _buildBottomNavigation(),
        ],
      )
    );
  }

  Widget _buildWhiteGradient() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 110,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0, 1),
            end: Alignment(0, 0),
            colors: [
              Colors.white,
              Colors.white.withOpacity(0.9),
              Colors.white.withOpacity(0.5),
              Colors.white.withOpacity(0)
            ]
          )
        ),
      )
    );
  }

  Widget _buildBottomNavigation() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.fromLTRB(AppSize.baseSpace, 0, AppSize.baseSpace, 20),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 2),
        decoration: BoxDecoration(
          color: AppPalette.green,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          boxShadow: [
            BoxShadow(color: Color(0x55000000), spreadRadius: 0, blurRadius: 35, offset: Offset(10, 35)),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withAlpha(150),
          unselectedFontSize: 12,
          selectedFontSize: 12,
          onTap: (index) {
            setState(() {
              _bottomNavCurrentIndex = index;
            });
          },
          currentIndex: _bottomNavCurrentIndex,
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.storefront_outlined),
              icon: Icon(Icons.storefront_outlined),
              title: Text(_bottomNavCurrentIndex == 0 ? '•' : '', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.assignment_outlined),
              icon: Icon(Icons.assignment_outlined),
              title: Text(_bottomNavCurrentIndex == 1 ? '•' : '', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.place_outlined),
              icon: Icon(Icons.place_outlined),
              title: Text(_bottomNavCurrentIndex == 2 ? '•' : '', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.chat_bubble_outline),
              icon: Icon(Icons.chat_bubble_outline),
              title: Text(_bottomNavCurrentIndex == 3 ? '•' : '', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.person_outline),
              icon: Icon(Icons.person_outline),
              title: Text(_bottomNavCurrentIndex == 4 ? '•' : '', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        )
      ),
    );
  }
}