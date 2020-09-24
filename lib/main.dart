import 'package:foodie/constant.dart';
import 'package:foodie/ui/launcher/launcher_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodie',
      theme: ThemeData(
        fontFamily: 'Avenir',
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: AppPalette.green,
        accentColor: AppPalette.green,
      ),
      home: LauncherPage(),
    );
  }
}
