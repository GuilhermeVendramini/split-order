import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_order/src/widgets/lists/order_list.dart';

import 'app_controller.dart';
import 'widgets/components/default_appbar.dart';
import 'widgets/lists/people_list.dart';

class AppPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<AppController>(context);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        appBar: DefaultAppBar.appBar,
        body: SingleChildScrollView(
          controller: _controller.scrollController,
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              OrderList(),
              SizedBox(
                height: 20.0,
              ),
              PeopleList(),
            ],
          ),
        ),
      ),
    );
  }
}