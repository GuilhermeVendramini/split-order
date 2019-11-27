import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'app_controller.g.dart';

class AppController = _AppController with _$AppController;

abstract class _AppController with Store {
  ScrollController scrollController = ScrollController();
  double screenHeight, screenWidth;

  _AppController() {
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      print("reach the bottom");
    }
    if (scrollController.offset <= scrollController.position.minScrollExtent &&
        !scrollController.position.outOfRange) {
      print("reach the top");
    }
  }

  void onPointerMove(PointerEvent details) {
    print(screenHeight);
    print(details.position.dy);
    if(details.position.dy >= screenHeight) {
      print('EIIIII');
      scrollController.animateTo(details.position.dy,
          curve: Curves.linear, duration: Duration (milliseconds: 500));
    }
  }
}
