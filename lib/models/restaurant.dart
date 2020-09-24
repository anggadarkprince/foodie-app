import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Restaurant extends Equatable {
  final int id;
  final String name;
  final String description;
  final String address;
  final String lng;
  final String lat;
  final int star;

  Restaurant({
    this.id,
    @required this.name, 
    @required this.description, 
    @required this.address, 
    @required this.lng, 
    @required this.lat, 
    this.star = 0
  });

  @override
  List<Object> get props => [
    id, name, description, address, lng, lat, star
  ];
}