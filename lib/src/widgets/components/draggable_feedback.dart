import 'package:flutter/material.dart';
import 'package:split_order/src/models/order_model.dart';

class DraggableFeedback extends StatelessWidget {
  final OrderModel order;
  final double positionX;
  final double positionY;

  DraggableFeedback(
      {@required this.order, this.positionX = 100.0, this.positionY = 100.0});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: positionY - 50.0,
              left: positionX - 50.0,
              child: Container(
                height: 80.0,
                width: 100.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/${order.image}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
