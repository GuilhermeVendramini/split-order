import 'package:flutter/material.dart';

class EmptyOrderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Icon(
            Icons.fastfood,
            color: Colors.grey,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'empty',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
