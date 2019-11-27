import 'package:flutter/foundation.dart';

class OrderModel {
  final int id;
  final String name;
  final String image;
  final int amount;
  final double price;

  OrderModel({@required this.id, @required this.name, @required this.image, @required this.amount, @required this.price});
}