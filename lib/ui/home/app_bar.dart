import 'package:flutter/material.dart';
import 'package:foodie/constant.dart';

class CustomAppBar extends AppBar {
  CustomAppBar(): super(
    elevation: 0.5,
    backgroundColor: Colors.white,
    flexibleSpace: _buildAppBar()
  );

  static Widget _buildAppBar() {
    return Container(
      padding: EdgeInsets.only(left: AppSize.baseSpace, right: AppSize.baseSpace),
      height: 75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Foodie', style: TextStyle(color: AppPalette.dark, fontSize: 20, fontFamily: 'InterBold'))
            ],
          ),
          Row(
            children: [
              Icon(Icons.search, size: 24, color: AppPalette.dark),
              SizedBox(width: 10),
              Icon(Icons.shopping_bag_outlined, size: 24, color: AppPalette.dark),
            ],
          )
        ],
      ),
    );
  }
}