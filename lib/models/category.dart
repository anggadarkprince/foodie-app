import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Category extends Equatable {
  final String category;
  final String icon;
  final String description;

  Category({
    @required this.category, 
    @required this.icon, 
    this.description,
  });

  @override
  List<Object> get props => [
    category, description,
  ];
}