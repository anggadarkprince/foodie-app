import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodie/constant.dart';
import 'package:foodie/ui/landing/landing_view.dart';
import 'package:foodie/ui/launcher/welcome_view.dart';
import 'package:foodie/utils/shared_storage.dart';

class LauncherPage extends StatefulWidget {
  @override
  _LauncherPageState createState() => new _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  double itemSize = 0;
  double opacity = 0;
  Duration animationDuration = Duration(seconds: 2);
  bool appReady = false;
  bool showWelcome;

  void initState() {
    super.initState();

    SharedStorage().getData(AppPreferences.showWelcome, true).then((value) {
      if (mounted) {
        setState(() {
          showWelcome = value;
        });
      } else {
        showWelcome = value;
      }
    })
    .catchError((onError) {
      showWelcome = true;
    });

    startLaunching();
  }

  startLaunching() async {
    return Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return showWelcome ? WelcomePage() : LandingPage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 1), () {
      setState(() {
        itemSize = 150;
        opacity = 1;
      });
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedOpacity(
              duration: animationDuration,
              opacity: opacity,
              child: AnimatedContainer(
                duration: animationDuration,
                curve: Curves.easeInOutExpo,
                width: itemSize,
                height: itemSize,
                child: Image.asset(
                  "assets/icons/category-ingredients.png",
                  height: 150,
                  width: 150,
                ),
              ),
            ),
            SizedBox(height: 20),
            AnimatedOpacity(
              duration: animationDuration,
              opacity: opacity,
              child: Text("Foodie",
                style: TextStyle(
                  fontSize: 24,
                  color: AppPalette.green,
                  fontFamily: 'InterBold'
                )
              )
            ),
            AnimatedOpacity(
              duration: animationDuration,
              opacity: opacity,
              child: Text("From bitter to spicy",
                style: TextStyle(
                  fontSize: 16,
                  color: AppPalette.darkGrey,
                  fontFamily: 'Inter'
                )
              )
            ),
          ],
        ),
      ),
    );
  }
}
