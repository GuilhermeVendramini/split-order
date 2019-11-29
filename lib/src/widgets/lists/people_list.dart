import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:split_order/src/data/people_data.dart';
import 'package:split_order/src/widgets/cards/people_card.dart';

import '../../app_controller.dart';

class PeopleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<AppController>(context);

    return Observer(
      builder: (_) {
        return Container(
          height: _controller.listHeight,
          child: ListView.builder(
              controller: _controller.peopleScrollController,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: peopleData.length,
              itemBuilder: (BuildContext context, int index) {
                return PeopleCard(people: peopleData[index]);
              }),
        );
      },
    );
  }
}
