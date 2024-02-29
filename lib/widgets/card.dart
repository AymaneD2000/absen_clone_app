import 'package:flutter/material.dart';

class CardItems extends StatelessWidget {
  const CardItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(color: Colors.white, width: 4)),
      height: 50,
      width: 50,
      //color: Colors.grey,
    );
  }
}
