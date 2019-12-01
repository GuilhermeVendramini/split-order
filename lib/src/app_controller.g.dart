// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppController, Store {
  final _$ordersAtom = Atom(name: '_AppController.orders');

  @override
  List<OrderModel> get orders {
    _$ordersAtom.context.enforceReadPolicy(_$ordersAtom);
    _$ordersAtom.reportObserved();
    return super.orders;
  }

  @override
  set orders(List<OrderModel> value) {
    _$ordersAtom.context.conditionallyRunInAction(() {
      super.orders = value;
      _$ordersAtom.reportChanged();
    }, _$ordersAtom, name: '${_$ordersAtom.name}_set');
  }

  final _$listHeightAtom = Atom(name: '_AppController.listHeight');

  @override
  double get listHeight {
    _$listHeightAtom.context.enforceReadPolicy(_$listHeightAtom);
    _$listHeightAtom.reportObserved();
    return super.listHeight;
  }

  @override
  set listHeight(double value) {
    _$listHeightAtom.context.conditionallyRunInAction(() {
      super.listHeight = value;
      _$listHeightAtom.reportChanged();
    }, _$listHeightAtom, name: '${_$listHeightAtom.name}_set');
  }

  final _$orderAmountAtom = Atom(name: '_AppController.orderAmount');

  @override
  double get orderAmount {
    _$orderAmountAtom.context.enforceReadPolicy(_$orderAmountAtom);
    _$orderAmountAtom.reportObserved();
    return super.orderAmount;
  }

  @override
  set orderAmount(double value) {
    _$orderAmountAtom.context.conditionallyRunInAction(() {
      super.orderAmount = value;
      _$orderAmountAtom.reportChanged();
    }, _$orderAmountAtom, name: '${_$orderAmountAtom.name}_set');
  }

  final _$mainScrollKeyAtom = Atom(name: '_AppController.mainScrollKey');

  @override
  GlobalKey get mainScrollKey {
    _$mainScrollKeyAtom.context.enforceReadPolicy(_$mainScrollKeyAtom);
    _$mainScrollKeyAtom.reportObserved();
    return super.mainScrollKey;
  }

  @override
  set mainScrollKey(GlobalKey value) {
    _$mainScrollKeyAtom.context.conditionallyRunInAction(() {
      super.mainScrollKey = value;
      _$mainScrollKeyAtom.reportChanged();
    }, _$mainScrollKeyAtom, name: '${_$mainScrollKeyAtom.name}_set');
  }

  final _$orderByUserAtom = Atom(name: '_AppController.orderByUser');

  @override
  Map<int, List<OrderModel>> get orderByUser {
    _$orderByUserAtom.context.enforceReadPolicy(_$orderByUserAtom);
    _$orderByUserAtom.reportObserved();
    return super.orderByUser;
  }

  @override
  set orderByUser(Map<int, List<OrderModel>> value) {
    _$orderByUserAtom.context.conditionallyRunInAction(() {
      super.orderByUser = value;
      _$orderByUserAtom.reportChanged();
    }, _$orderByUserAtom, name: '${_$orderByUserAtom.name}_set');
  }

  final _$amountByUserAtom = Atom(name: '_AppController.amountByUser');

  @override
  Map<int, double> get amountByUser {
    _$amountByUserAtom.context.enforceReadPolicy(_$amountByUserAtom);
    _$amountByUserAtom.reportObserved();
    return super.amountByUser;
  }

  @override
  set amountByUser(Map<int, double> value) {
    _$amountByUserAtom.context.conditionallyRunInAction(() {
      super.amountByUser = value;
      _$amountByUserAtom.reportChanged();
    }, _$amountByUserAtom, name: '${_$amountByUserAtom.name}_set');
  }

  final _$_AppControllerActionController =
      ActionController(name: '_AppController');

  @override
  dynamic moveOrder({@required int userId, @required OrderModel order}) {
    final _$actionInfo = _$_AppControllerActionController.startAction();
    try {
      return super.moveOrder(userId: userId, order: order);
    } finally {
      _$_AppControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeFromOrderData({@required dynamic order}) {
    final _$actionInfo = _$_AppControllerActionController.startAction();
    try {
      return super.removeFromOrderData(order: order);
    } finally {
      _$_AppControllerActionController.endAction(_$actionInfo);
    }
  }
}
