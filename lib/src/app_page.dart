import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:split_order/src/widgets/lists/order_list.dart';

import 'app_controller.dart';
import 'widgets/components/app_title.dart';
import 'widgets/components/empty_order_list.dart';
import 'widgets/lists/people_list.dart';

class AppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<AppController>(context);
    final _mainScrollKey = GlobalKey();

    _controller.mainScrollKey = _mainScrollKey;

    return MaterialApp(
      title: 'Split Order',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          key: _mainScrollKey,
          controller: _controller.mainScrollController,
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppTitle(),
              Observer(
                builder: (_) {
                  return AnimatedCrossFade(
                    crossFadeState: _controller.orders != null &&
                            _controller.orders.isNotEmpty
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: Duration(milliseconds: 500),
                    firstChild: OrderList(),
                    secondChild: EmptyOrderList(),
                  );
                },
              ),
              SizedBox(
                height: 24.0,
              ),
              PeopleList(),
            ],
          ),
        ),
      ),
    );
  }
}
