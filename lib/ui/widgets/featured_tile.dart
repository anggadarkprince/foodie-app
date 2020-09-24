import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodie/constant.dart';
import 'package:foodie/models/food.dart';
import 'package:intl/intl.dart';

class FeaturedTile extends StatelessWidget {
  final Food food;
  final Function onTap;
  
  FeaturedTile(this.food, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Container(
        margin: EdgeInsets.only(right: AppSize.baseSpace),
        child: Column(
          children: <Widget>[
            Container(
              width: 135,
              height: 135,
              decoration: BoxDecoration(
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(food.image),
                  fit: BoxFit.cover
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              food.title,
              style: TextStyle(fontWeight: FontWeight.bold)
            ),
            SizedBox(height: 2),
            Text(
              NumberFormat.currency(locale: 'id_ID', symbol: 'IDR ', decimalDigits: 0).format(food.price),
              style: TextStyle(color: AppPalette.darkGrey),
            ),
          ],
        ),
      )
    );
  }
}