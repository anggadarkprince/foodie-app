import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodie/models/category.dart';

class CategoryTile extends StatelessWidget {
  final Category category;
  final Function onTap;
  
  CategoryTile(this.category, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 58,
              width: 58,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(category.icon))
              ),
            ),
            SizedBox(height: 10),
            Text(category.category, style: TextStyle(fontSize: 12)),
          ],
        ),
      )
    );
  }
}