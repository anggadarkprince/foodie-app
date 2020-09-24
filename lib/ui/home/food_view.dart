import 'package:flutter/material.dart';
import 'package:foodie/models/food.dart';

class FoodPage extends StatefulWidget {
  final Food food;

  FoodPage(this.food);
  
  @override
  _FoodPageState createState() => new _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Food'),
      ),
    );
  }
}