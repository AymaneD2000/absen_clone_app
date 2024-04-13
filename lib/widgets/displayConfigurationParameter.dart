import 'package:absens_clone_app/Models/products.dart';
import 'package:absens_clone_app/Screens/displayInformation.dart';
import 'package:absens_clone_app/widgets/getX.dart';
import 'package:absens_clone_app/widgets/texte.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DisplayConfiguration extends StatefulWidget {
  DisplayConfiguration({this.product, Key? key}) : super(key: key);
  Product? product;
  @override
  State<DisplayConfiguration> createState() => _DisplayConfigurationState();
}

class _DisplayConfigurationState extends State<DisplayConfiguration> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //DisplayInformation(),
              Gap(10),
              const Center(
                child: WText(
                  'Display Configuration',
                  size: 20.0,
                  weight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9999,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const WText('Dimensions (m): ',
                          size: 16.0,
                          weight: FontWeight.bold,
                          color: Color.fromARGB(255, 11, 68, 99)),
                      const WText('Width:'),
                      SizedBox(
                        width: 100.0,
                        child: Text(
                            "${ProductConfigurations.selectedConfiguration.isNotEmpty ? ProductConfigurations.selectedConfiguration.first.resolution_width * 0.01 : 0}"),
                      ),
                      const WText('Height:'),
                      SizedBox(
                        width: 100.0,
                        child: WText(
                            "${ProductConfigurations.selectedConfiguration.isNotEmpty ? ProductConfigurations.selectedConfiguration.first.resolution_height * 0.01 : 0}"),
                      ),
                      const Text('Size:'),
                      SizedBox(
                        width: 100.0,
                        child: WText(
                            "${ProductConfigurations.selectedConfiguration.isNotEmpty ? ProductConfigurations.selectedConfiguration.first.resolution_width * ProductConfigurations.selectedConfiguration.first.resolution_height * 0.01 : 0}}"),
                      ),
                    ],
                  ),
                ),
              ),
              //const SizedBox(height: 20.0),
              LineBetween(context),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.99999,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const WText(
                        'Dimensions (ft): ',
                        color: Color.fromARGB(255, 11, 68, 99),
                        size: 16.0,
                        weight: FontWeight.bold,
                      ),
                      const WText('Width:'),
                      SizedBox(
                        width: 100.0,
                        child: WText(
                            "${ProductConfigurations.selectedConfiguration.isNotEmpty ? ProductConfigurations.selectedConfiguration.first.resolution_width * 0.01 * 3.28084 : 0}"),
                      ),
                      const WText('Height:'),
                      SizedBox(
                        width: 100.0,
                        child: WText(
                            "${ProductConfigurations.selectedConfiguration.isNotEmpty ? ProductConfigurations.selectedConfiguration.first.resolution_height * 0.01 * 3.28084 : 0}"),
                      ),
                      const WText('Size:'),
                      SizedBox(
                        width: 100.0,
                        child: WText(
                            "${ProductConfigurations.selectedConfiguration.isNotEmpty ? ProductConfigurations.selectedConfiguration.first.resolution_width * ProductConfigurations.selectedConfiguration.first.resolution_height * 0.01 * 3.28084 : 0}"),
                      ),
                    ],
                  ),
                ),
              ),
              LineBetween(context),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const WText('Max Power/W: ',
                          size: 16.0,
                          weight: FontWeight.bold,
                          color: Color.fromARGB(255, 11, 68, 99)),
                      SizedBox(
                        width: 100.0,
                        child: WText(
                            "${ProductConfigurations.selectedConfiguration.isNotEmpty ? ProductConfigurations.resolution_height_count * ProductConfigurations.resolution_width_count * ProductConfigurations.selectedConfiguration.first.modulePower : 0}"),
                      ),
                      const WText('Avg Power/W: ',
                          size: 16.0,
                          weight: FontWeight.bold,
                          color: Color.fromARGB(255, 11, 68, 99)),
                      SizedBox(
                        width: 100.0,
                        child: WText(
                            "${ProductConfigurations.selectedConfiguration.isNotEmpty ? ProductConfigurations.resolution_height_count * ProductConfigurations.resolution_width_count * ProductConfigurations.selectedConfiguration.first.modulePower * ProductConfigurations.selectedConfiguration.first.brightness * ProductConfigurations.selectedConfiguration.first.usageFactor : 0}"),
                      ),
                    ],
                  ),
                ),
              ),
              LineBetween(context),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const WText('Data Runs: ',
                          size: 16.0,
                          weight: FontWeight.bold,
                          color: Color.fromARGB(255, 11, 68, 99)),
                      SizedBox(
                        width: 100.0,
                        child: WText(
                            "${ProductConfigurations.selectedConfiguration.isNotEmpty ? ProductConfigurations.selectedConfiguration.first.modulePower : 0}"),
                      ),
                      const WText('AC Required: ',
                          size: 16.0,
                          weight: FontWeight.bold,
                          color: Color.fromARGB(255, 11, 68, 99)),
                      const SizedBox(
                        width: 100.0,
                        child: TextField(),
                      ),
                    ],
                  ),
                ),
              ),
              LineBetween(context),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.99999,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const WText(
                        'Weight (Kg/Lbs): ',
                        color: Color.fromARGB(255, 11, 68, 99),
                        size: 16.0,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(
                        width: 100.0,
                        child: WText(
                            "${ProductConfigurations.selectedConfiguration.isNotEmpty ? ProductConfigurations.selectedConfiguration.first.weigh_per_module * ProductConfigurations.resolution_height_count * ProductConfigurations.resolution_width_count * 2.20462 : 0}"),
                      ),
                      const WText(
                        '# of Sending Box: ',
                        size: 16.0,
                        weight: FontWeight.bold,
                      ),
                      const SizedBox(
                        width: 100.0,
                        child: WText(""),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container LineBetween(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 10, bottom: 10),
      color: Colors.grey,
      width: MediaQuery.of(context).size.width,
      height: 1,
    );
  }
}
