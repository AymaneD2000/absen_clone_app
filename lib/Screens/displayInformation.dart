import 'package:absens_clone_app/helper/provider.dart';
import 'package:absens_clone_app/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/getX.dart';

class DisplayInformation extends StatefulWidget {
  const DisplayInformation({super.key});
  @override
  State<DisplayInformation> createState() => _DisplayInformationState();
}

class _DisplayInformationState extends State<DisplayInformation> {
  //late MyProvider provider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // provider = My
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(builder: (context, snapshot, child) {
      return Column(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: GridView.custom(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: snapshot.resolution_height_count == 0
                          ? 1
                          : snapshot.resolution_height_count),
                  childrenDelegate: SliverChildBuilderDelegate(
                    childCount: snapshot.resolution_height_count *
                        snapshot.resolution_width_count,
                    (context, index) {
                      return CardItems();
                    },
                  )))
        ],
      );
    });
  }
}
