import 'dart:math';

import 'package:flutter/material.dart';
import 'package:foodie/constant.dart';
import 'package:foodie/helper.dart';
import 'package:foodie/ui/auth/register_view.dart';
import 'package:foodie/ui/landing/landing_view.dart';
import 'package:foodie/utils/shared_storage.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List categories = Helper.getCategoryList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(AppSize.baseSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 160,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(categories[Random().nextInt(categories.length)].icon))
              ),
            ),
            SizedBox(height: 50),
            Text(
              "From biter to spicy",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26, color: AppPalette.green, fontFamily: AppFontFamily.primaryBold)
            ),
            SizedBox(height: 10),
            Text(
              'Different menu everyday, hmm Yummy...',
              style: TextStyle(color: AppPalette.darkGrey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 100),
            Container(
              width: 250,
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(fontSize: 16, color: AppPalette.white),
                ),
                color: AppPalette.green,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                }
              )
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Window shopping', style: TextStyle(color: AppPalette.dark)),
                Text(',', style: TextStyle(color: AppPalette.dark)),
                SizedBox(width: 5),
                GestureDetector(
                  child: Text(
                    "Sign In as Guest",
                    style: TextStyle(color: AppPalette.green, fontFamily: AppFontFamily.primaryBold)
                  ),
                  onTap: () {
                    SharedStorage().setData(AppPreferences.showWelcome, false);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LandingPage()));
                  },
                )
              ]
            )
          ]
        )
      )
    );
  }
}