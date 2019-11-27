import 'package:flutter/material.dart';
import 'package:split_order/src/models/order_model.dart';

class OrderContainer extends StatelessWidget {

  final OrderModel order;
  final Color containerColor;

  OrderContainer({@required this.order, @required this.containerColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        color: containerColor,
        border: Border.all(color: Colors.grey),
      ),
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 60.0,
            width: 80.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/${order.image}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text('${order.amount} x '),
          Text('${order.name}'),
          Text('${order.price}'),
        ],
      ),
    );
  }
}
