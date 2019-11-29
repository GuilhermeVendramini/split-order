import 'package:flutter/material.dart';
import 'package:split_order/src/models/order_model.dart';

class DraggableFeedback extends StatefulWidget {
  final OrderModel order;
  final double positionX;
  final double positionY;

  DraggableFeedback(
      {@required this.order, this.positionX = 100.0, this.positionY = 100.0});

  @override
  _DraggableFeedbackState createState() => _DraggableFeedbackState();
}

class _DraggableFeedbackState extends State<DraggableFeedback> {
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
    return Material(
      color: Colors.transparent,
      child: AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0,
        duration: Duration(milliseconds: 500),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: widget.positionY - 50.0,
                left: widget.positionX - 50.0,
                child: Container(
                  height: 100.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    image: DecorationImage(
                      image: AssetImage('assets/images/${widget.order.image}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
