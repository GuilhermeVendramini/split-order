import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40.0, bottom: 20.0),
      child: RichText(
        text: TextSpan(
          text: 'Split ',
          style: TextStyle(
            fontSize: 40.0,
            color: Colors.black,
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'order',
              style: TextStyle(
                fontWeight: FontWeight.w200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
