import 'package:flutter/material.dart';
import 'package:absens_clone_app/widgets/displayConfigurationParameter.dart';
import 'package:absens_clone_app/widgets/mainDataCableCalculation.dart';
import 'package:absens_clone_app/widgets/productInformation.dart';
import 'package:flutter/widgets.dart';

class OrtherScreen extends StatelessWidget {
  OrtherScreen({required this.contexte});
  BuildContext contexte;
  @override
  Widget build(BuildContext contexte) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(contexte).size.height * 0.5,
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
