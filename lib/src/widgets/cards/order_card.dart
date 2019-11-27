import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_order/src/models/order_model.dart';
import 'package:split_order/src/widgets/components/draggable_feedback.dart';
import 'package:split_order/src/widgets/components/order_container.dart';

import '../../app_controller.dart';

class OrderCard extends StatefulWidget {
  final OrderModel order;

  OrderCard({@required this.order});

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  double _positionX = 100.0;
  double _positionY = 100.0;
  Color _containerColor = Colors.white;

  void _onTapDown(BuildContext context, TapDownDetails details) {
    final RenderBox box = context.findRenderObject();
    final Offset localOffset = box.globalToLocal(details.globalPosition);

    setState(() {
      _containerColor = Colors.grey;
      _positionX = localOffset.dx;
      _positionY = localOffset.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<AppController>(context);
    final _size = MediaQuery.of(context).size;
    _controller.screenHeight = _size.height;
    _controller.screenWidth = _size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Listener(
        onPointerMove: (PointerEvent details) => _controller.onPointerMove(details),
        child: Draggable<int>(
          onDraggableCanceled: (_, __) {
            setState(() {
              _containerColor = Colors.white;
            });
          },
          data: 1,
          childWhenDragging: Container(
            height: 122.0,
          ),
          child: GestureDetector(
            onTapDown: (TapDownDetails details) => _onTapDown(context, details),
            onTapUp: (_) {
              setState(() {
                _containerColor = Colors.white;
              });
            },
            child: OrderContainer(
              order: widget.order,
              containerColor: _containerColor,
            ),
          ),
          feedback: DraggableFeedback(
            order: widget.order,
            positionX: _positionX,
            positionY: _positionY,
          ),
        ),
      ),
    );
  }
}
