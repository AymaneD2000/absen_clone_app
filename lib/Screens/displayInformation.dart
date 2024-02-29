import 'package:absens_clone_app/widgets/card.dart';
import 'package:flutter/material.dart';

class DisplayInformation extends StatefulWidget {
  const DisplayInformation({super.key});

  @override
  State<DisplayInformation> createState() => _DisplayInformationState();
}

class _DisplayInformationState extends State<DisplayInformation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Container(
                child: GridView.custom(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    childrenDelegate: SliverChildBuilderDelegate(
                      childCount: 2,
                      (context, index) {
                        return CardItems();
                      },
                    ))))
      ],
    );
  }
}
