import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_order/src/widgets/cards/order_card.dart';

import '../../app_controller.dart';

class OrderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<AppController>(context);

    return Column(
      children: <Widget>[
        Column(
          children: _controller.orders
              .map((order) => OrderCard(order: order))
              .toList(),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            '\$${_controller.orderAmount.toString()}',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
