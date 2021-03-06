import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:split_order/src/models/order_model.dart';

import 'data/orders_data.dart';

part 'app_controller.g.dart';

class AppController = _AppController with _$AppController;

abstract class _AppController with Store {
  _AppController() {
    orderAmount =
        orders.map((order) => order.price).toList().reduce((a, b) => a + b);
  }

  ScrollController mainScrollController = ScrollController();
  ScrollController peopleScrollController = ScrollController();

  double _screenHeight, _screenWidth;

  @observable
  List<OrderModel> orders = ordersData;

  int _itemOrderLength = 1;

  @observable
  double listHeight = 300.0;

  @observable
  double orderAmount = 00.0;

  @observable
  GlobalKey mainScrollKey;

  @observable
  Map<int, List<OrderModel>> orderByUser = {};

  @observable
  Map<int, double> amountByUser = {};

  bool overDragTarget = false;

  @action
  moveOrder({@required int userId, @required OrderModel order}) {
    if (orderByUser[userId] == null) {
      orderByUser.putIfAbsent(userId, () => [order]);
      amountByUser.putIfAbsent(userId, () => order.price);
    } else {
      orderByUser[userId].add(order);
      amountByUser[userId] = amountByUser[userId] + order.price;
    }

    int _userOrderLength = orderByUser[userId].toList().length;

    if (listHeight == 300) {
      listHeight = listHeight + 60;
    }

    if (_itemOrderLength < _userOrderLength) {
      _itemOrderLength = _userOrderLength;
      listHeight = listHeight + 60;
    }

    orderAmount = orderAmount - order.price;
  }

  @action
  removeFromOrderData({@required order}) {
    List<OrderModel> newOrders = orders
      ..removeWhere((orderData) => orderData.id == order.id);
    orders = newOrders;
  }

  void setScreenSize({@required height, @required width}) {
    _screenHeight = height;
    _screenWidth = width;
  }

  void onPointerMove(PointerEvent details) {
    if (details.position.dy + 40.0 >= _screenHeight) {
      mainScrollController.animateTo(details.position.dy + 40.0,
          curve: Curves.linear, duration: Duration(seconds: 1));
    }

    if (overDragTarget && details.position.dx + 100.0 >= _screenWidth) {
      peopleScrollController.animateTo(details.position.dx,
          curve: Curves.linear, duration: Duration(milliseconds: 500));
    } else if (overDragTarget && details.position.dx - 40.0 < 0.0) {
      peopleScrollController.animateTo(details.position.dx - 20.0,
          curve: Curves.linear, duration: Duration(milliseconds: 500));
    }
  }
}
