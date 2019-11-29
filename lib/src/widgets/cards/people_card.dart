import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_order/src/models/order_model.dart';
import 'package:split_order/src/models/people_model.dart';
import 'package:split_order/src/widgets/lists/order_by_user_list.dart';

import '../../app_controller.dart';

class PeopleCard extends StatefulWidget {
  final PeopleModel people;

  PeopleCard({@required this.people});

  @override
  _PeopleCardState createState() => _PeopleCardState();
}

class _PeopleCardState extends State<PeopleCard> {
  Color _containerColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<AppController>(context);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey[300],
              offset: Offset(1.0, 1.0),
              blurRadius: 4.0,
              spreadRadius: 1.0
          )
        ],
        color: _containerColor,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/${widget.people.image}'),
            radius: 38.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            widget.people.name,
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          DragTarget<OrderModel>(
            builder: (BuildContext context, List<OrderModel> incoming,
                List rejected) {
              return OrderByUserList(
                userId: widget.people.id,
              );
            },
            onWillAccept: (data) {
              setState(() {
                _containerColor = Colors.grey[100];
              });
              return true;
            },
            onAccept: (data) {
              setState(() {
                _containerColor = Colors.white;
              });
              _controller.moveOrder(userId: widget.people.id, order: data);
            },
            onLeave: (data) {
              setState(() {
                _containerColor = Colors.white;
              });
            },
          ),
        ],
      ),
    );
  }
}
