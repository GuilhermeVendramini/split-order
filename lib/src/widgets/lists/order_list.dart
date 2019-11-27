import 'package:flutter/material.dart';
import 'package:split_order/src/data/orders_data.dart';
import 'package:split_order/src/widgets/cards/order_card.dart';

class OrderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: ordersData.map((order) => OrderCard(order: order)).toList(),
    );
  }
}
