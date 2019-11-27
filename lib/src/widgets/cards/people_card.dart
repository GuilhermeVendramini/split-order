import 'package:flutter/material.dart';
import 'package:split_order/src/models/people_model.dart';

class PeopleCard extends StatelessWidget {
  final PeopleModel people;

  PeopleCard({@required this.people});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        border: Border.all(color: Colors.grey),
      ),
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/${people.image}'),
            radius: 32.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            people.name,
          ),
          /*DragTarget<int>(
            builder: (BuildContext context, List<int> incoming, List rejected) {
              return Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Text('Order'),
                alignment: Alignment.center,
              );
            },
            onWillAccept: (data) {
              print('-----------------');
              print('onWillAccept');
              print(data);
              print('-----------------');
              return true;
            },
            onAccept: (data) {
              print('-----------------');
              print('onAccept');
              print(data);
              print('-----------------');
            },
            onLeave: (data) {
              print('-----------------');
              print('onLeave');
              print(data);
              print('-----------------');
            },
          ),*/
        ],
      ),
    );
  }
}
