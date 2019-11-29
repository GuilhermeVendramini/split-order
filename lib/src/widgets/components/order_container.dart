import 'package:flutter/material.dart';
import 'package:split_order/src/models/order_model.dart';

class OrderContainer extends StatefulWidget {
  final OrderModel order;

  OrderContainer({@required this.order});

  @override
  _OrderContainerState createState() => _OrderContainerState();
}

class _OrderContainerState extends State<OrderContainer> {
  bool _visible = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 10), () {
      setState(() {
        _visible = true;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 500),
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(color: Colors.grey[200]),
        ),
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 60.0,
              width: 80.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                image: DecorationImage(
                  image: AssetImage('assets/images/${widget.order.image}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              '${widget.order.amount} x ',
            ),
            Text(
              '${widget.order.name}',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Text(
              '\$${widget.order.price}',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
