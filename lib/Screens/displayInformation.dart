import 'package:absens_clone_app/widgets/card.dart';
import 'package:flutter/material.dart';

import '../widgets/getX.dart';

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
            child: GridView.custom(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        ProductConfigurations.resolution_height_count == 0
                            ? 1
                            : ProductConfigurations.resolution_height_count),
                childrenDelegate: SliverChildBuilderDelegate(
                  childCount: ProductConfigurations.resolution_height_count *
                      ProductConfigurations.resolution_width_count,
                  (context, index) {
                    return CardItems();
                  },
                )))
      ],
    );
  }
}
