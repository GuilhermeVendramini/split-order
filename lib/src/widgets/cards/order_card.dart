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

  void _onTapDown(BuildContext context, TapDownDetails details) {
    final RenderBox box = context.findRenderObject();
    final Offset localOffset = box.globalToLocal(details.globalPosition);

    setState(() {
      _positionX = localOffset.dx;
      _positionY = localOffset.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<AppController>(context);
    final _size = MediaQuery.of(context).size;

    _controller.setScreenSize(height: _size.height, width: _size.width);

    return Container(
      child: Listener(
        onPointerMove: (PointerEvent details) =>
            _controller.onPointerMove(details),
        child: Draggable<OrderModel>(
          affinity: Axis.horizontal,
          data: widget.order,
          childWhenDragging: Container(
            height: 122.0,
          ),
          onDragCompleted: () =>
              _controller.removeFromOrderData(order: widget.order),
          child: GestureDetector(
            onTapDown: (TapDownDetails details) => _onTapDown(context, details),
            child: OrderContainer(
              order: widget.order,
            ),
          ),
          feedback: DraggableFeedback(
            order: widget.order,
            containerWidth: _size.width,
            positionX: _positionX,
            positionY: _positionY,
          ),
        ),
      ),
    );
  }
}
