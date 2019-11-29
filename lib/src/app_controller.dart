import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:split_order/src/models/order_model.dart';

import 'data/orders_data.dart';

part 'app_controller.g.dart';

class AppController = _AppController with _$AppController;

abstract class _AppController with Store {

  _AppController() {
    orderAmount = orders.map((order) => order.price).toList().reduce((a, b) => a + b);
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

  @action
  moveOrder({@required int userId, @required OrderModel order}) {
    if (orderByUser[userId] == null) {
      orderByUser.putIfAbsent(userId, () => [order]);
    } else {
      orderByUser[userId].add(order);
    }

    int _userOrderLength = orderByUser[userId].toList().length;

    if (_itemOrderLength < _userOrderLength) {
      _itemOrderLength = _userOrderLength;
      listHeight = listHeight +  60;
    }

    orderAmount = orderAmount - order.price;
  }

  @action
  removeFromOrderData({@required order}) {
    List<OrderModel> newOrders = orders..removeWhere((orderData) => orderData.id == order.id);
    orders = newOrders;
  }

  void setScreenSize({@required height, @required width}) {
    _screenHeight = height;
    _screenWidth = width;
  }

  void onPointerMove(PointerEvent details) {
    if (details.position.dy + 40 >= _screenHeight) {
      mainScrollController.animateTo(details.position.dy + 40,
          curve: Curves.linear, duration: Duration(seconds: 1));
    }

    final RenderBox renderMainScroll =
        mainScrollKey.currentContext.findRenderObject();
    final mainScrollHeight = renderMainScroll.size.height;
    if (details.position.dy >= mainScrollHeight - 200 &&
        details.position.dx + 100 >= _screenWidth) {
      peopleScrollController.animateTo(details.position.dx + 50,
          curve: Curves.linear, duration: Duration(milliseconds: 500));
    } else if (details.position.dy >= mainScrollHeight - 200 &&
        details.position.dx - 20 < 0.0) {
      peopleScrollController.animateTo(details.position.dx - 20,
          curve: Curves.linear, duration: Duration(milliseconds: 500));
    }
  }
}
