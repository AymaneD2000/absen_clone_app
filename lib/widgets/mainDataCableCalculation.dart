import 'package:absens_clone_app/widgets/getX.dart';
import 'package:absens_clone_app/widgets/texte.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainDataCableCalculation extends StatefulWidget {
  const MainDataCableCalculation({Key? key}) : super(key: key);

  @override
  State<MainDataCableCalculation> createState() =>
      _MainDataCableCalculationState();
}

class _MainDataCableCalculationState extends State<MainDataCableCalculation> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.99999999999999999999999999,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: WText(
                'Main Data Cables Calculation',
                size: 20.0,
                weight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.999999,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const WText(
                      'Max Data Cascading: ',
                      size: 16.0,
                      weight: FontWeight.bold,
                      color: Color.fromARGB(255, 11, 68, 99),
                    ),
                    SizedBox(
                      width: 120,
                      child: WText(
                          "${ProductConfigurations.selectedBox.isNotEmpty ? (ProductConfigurations.selectedBox.first.npd * ProductConfigurations.selectedBox.first.dbmp) / ProductConfigurations.selectedBox.first.cv : 0}"),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.99999,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const WText(
                      'Max Power Cascading: ',
                      size: 16.0,
                      weight: FontWeight.bold,
                      color: Color.fromARGB(255, 11, 68, 99),
                    ),
                    SizedBox(
                      width: 120,
                      child: WText(
                          "${ProductConfigurations.selectedBox.isNotEmpty ? (ProductConfigurations.selectedBox.first.tc * ProductConfigurations.selectedBox.first.cm) : 0}"),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const WText(
                      'Horizontal Load: ',
                      size: 16.0,
                      weight: FontWeight.bold,
                      color: Color.fromARGB(255, 11, 68, 99),
                    ),
                    SizedBox(
                      width: 60,
                      child: WText(
                          "${ProductConfigurations.selectedBox.isNotEmpty ? (ProductConfigurations.selectedBox.first.dbmp) / ProductConfigurations.selectedBox.first.cv : 0}"),
                    ),
                    const SizedBox(width: 20.0),
                    const WText(
                      'Vertical Load: ',
                      size: 16.0,
                      weight: FontWeight.bold,
                      color: Color.fromARGB(255, 11, 68, 99),
                    ),
                    SizedBox(
                      width: 60,
                      child: WText(
                          "${ProductConfigurations.selectedBox.isNotEmpty && ProductConfigurations.resolution_height_count != 0 ? ((ProductConfigurations.selectedBox.first.dbmp) / ProductConfigurations.selectedBox.first.cv) / ProductConfigurations.resolution_height_count : 0}"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
