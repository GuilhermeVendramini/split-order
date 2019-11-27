import 'package:flutter/material.dart';
import 'package:split_order/src/data/people_data.dart';
import 'package:split_order/src/widgets/cards/people_card.dart';

class PeopleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: peopleData.length,
          itemBuilder: (BuildContext context, int index) {
            return PeopleCard(people: peopleData[index]);
          }),
    );
  }
}
