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
