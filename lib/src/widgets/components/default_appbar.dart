import 'package:flutter/material.dart';

abstract class DefaultAppBar {
  DefaultAppBar._();

  static final AppBar appBar = AppBar(
    title: Text('Split Order'),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}
