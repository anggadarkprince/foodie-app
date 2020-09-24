import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Food extends Equatable {
  final int id;
  final int restaurantId;
  final String title;
  final String description;
  final double price;
  final String category;
  final String image;
  final int star;

  Food({
    this.id, 
    this.restaurantId, 
    @required this.title, 
    @required this.description,
    @required this.price,
    @required this.image,
    this.category,
    this.star = 0
  });

  @override
  List<Object> get props => [
    id, restaurantId, title, description, price, category, image, star
  ];
}