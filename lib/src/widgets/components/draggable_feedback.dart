import 'package:flutter/material.dart';
import 'package:split_order/src/models/order_model.dart';

class DraggableFeedback extends StatefulWidget {
  final OrderModel order;
  final double positionX;
  final double positionY;
  final double containerWidth;

  DraggableFeedback(
      {@required this.order,
      @required this.containerWidth,
      this.positionX = 100.0,
      this.positionY = 100.0});

  @override
  _DraggableFeedbackState createState() =>
      _DraggableFeedbackState(containerWidth: containerWidth);
}

class _DraggableFeedbackState extends State<DraggableFeedback> {
  final double containerWidth;
  double _containerWidth;

  _DraggableFeedbackState({@required this.containerWidth}) {
    _containerWidth = containerWidth;
  }

  bool _visible = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 10), () {
      setState(() {
        _visible = true;
        _containerWidth = 120.0;
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
        duration: Duration(milliseconds: 600),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: widget.positionY - 50.0,
                left: widget.positionX - 50.0,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 100.0,
                  width: _containerWidth,
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
