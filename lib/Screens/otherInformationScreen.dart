import 'package:flutter/material.dart';
import 'package:absens_clone_app/widgets/displayConfigurationParameter.dart';
import 'package:absens_clone_app/widgets/mainDataCableCalculation.dart';
import 'package:absens_clone_app/widgets/productInformation.dart';
import 'package:flutter/widgets.dart';

class OrtherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: PageView(
            children: [
              ProductConfiguration(),
              MainDataCableCalculation(),
              DisplayConfiguration(),
            ],
          ),
        ),
      ],
    );
  }
}
