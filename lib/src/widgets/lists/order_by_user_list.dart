import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../app_controller.dart';

class OrderByUserList extends StatelessWidget {
  final int userId;

  OrderByUserList({@required this.userId});

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<AppController>(context);

    return Observer(
      builder: (_) {
        return Container(
          width: 100.0,
          height: _controller.listHeight - 170.0,
          child: Observer(
            builder: (_) {
              if (_controller.orderByUser[userId] == null ||
                  _controller.orderByUser[userId].isEmpty) {
                return Container();
              }

              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: _controller.orderByUser[userId].length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 60.0,
                      width: 80.0,
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/${_controller.orderByUser[userId][index].image}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  });
            },
          ),
        );
      },
    );
  }
}
