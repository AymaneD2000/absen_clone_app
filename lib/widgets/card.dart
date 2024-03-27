import 'package:flutter/material.dart';

class CardItems extends StatelessWidget {
  CardItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(color: Colors.white, width: 3)),
      // height: h,
      // width: v,
      //color: Colors.grey,
    );
  }
}
