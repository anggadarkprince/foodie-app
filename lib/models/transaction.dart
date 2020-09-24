import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum TransactionType {
  DEBIT, CREDIT
}

enum TransactionCaregory {
  TOP_UP, PAYMENT, VOUCHER
}

class Transaction extends Equatable {
  final int id;
  final int userId;
  final String type;
  final String category;
  final String title;
  final String subtitle;
  final int amount;
  final DateTime createdAt;

  Transaction({
    this.id, 
    @required this.userId, 
    @required this.type, 
    @required this.category, 
    @required this.title, 
    this.subtitle = '', 
    this.amount = 0, 
    @required this.createdAt
  });

  @override
  List<Object> get props => [
    id, 
    userId, 
    type, 
    category, 
    title, 
    subtitle, 
    amount, 
    createdAt
  ];
}