import 'package:absens_clone_app/Models/products.dart';
import 'package:absens_clone_app/widgets/productInformation.dart';
import 'package:flutter/material.dart';

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
      height: MediaQuery.of(context).size.height * 0.5,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Display Configuration',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9999,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const Text(
                        'Dimensions (m): ',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text('Width:'),
                      SizedBox(
                        width: 100.0,
                        child: Text(
                            "${ProductConfiguration.selectedConfiguration != null ? ProductConfiguration.selectedConfiguration!.resolution_width * 0.01 : 0}"),
                      ),
                      Text('Height:'),
                      SizedBox(
                        width: 100.0,
                        child: Text(
                            "${ProductConfiguration.selectedConfiguration != null ? ProductConfiguration.selectedConfiguration!.resolution_height * 0.01 : 0}"),
                      ),
                      Text('Size:'),
                      SizedBox(
                        width: 100.0,
                        child: Text(
                            "${ProductConfiguration.selectedConfiguration != null ? ProductConfiguration.selectedConfiguration!.resolution_width * ProductConfiguration.selectedConfiguration!.resolution_height! * 0.01 : 0}}"),
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
                      const Text(
                        'Dimensions (ft): ',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text('Width:'),
                      SizedBox(
                        width: 100.0,
                        child: Text(
                            "${ProductConfiguration.selectedConfiguration != null ? ProductConfiguration.selectedConfiguration!.resolution_width * 0.01 * 3.28084 : 0}"),
                      ),
                      const Text('Height:'),
                      SizedBox(
                        width: 100.0,
                        child: Text(
                            "${ProductConfiguration.selectedConfiguration != null ? ProductConfiguration.selectedConfiguration!.resolution_height * 0.01 * 3.28084 : 0}"),
                      ),
                      const Text('Size:'),
                      SizedBox(
                        width: 100.0,
                        child: Text(
                            "${ProductConfiguration.selectedConfiguration != null ? ProductConfiguration.selectedConfiguration!.resolution_width * ProductConfiguration.selectedConfiguration!.resolution_height * 0.01 * 3.28084 : 0}"),
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
                      Text(
                        'Max Power/W: ',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 100.0,
                        child: Text(
                            "${ProductConfiguration.selectedConfiguration != null ? ProductConfiguration.resolution_height_count * ProductConfiguration.resolution_width_count * ProductConfiguration.selectedConfiguration!.modulePower : 0}"),
                      ),
                      Text(
                        'Avg Power/W: ',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 100.0,
                        child: Text(
                            "${ProductConfiguration.selectedConfiguration != null ? ProductConfiguration.resolution_height_count * ProductConfiguration.resolution_width_count * ProductConfiguration.selectedConfiguration!.modulePower * ProductConfiguration.selectedConfiguration!.brightness * ProductConfiguration.selectedConfiguration!.usageFactor : 0}"),
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
                      Text(
                        'Data Runs: ',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 100.0,
                        child: Text(
                            "${ProductConfiguration.selectedConfiguration != null ? ProductConfiguration.selectedConfiguration!.modulePower : 0}"),
                      ),
                      Text(
                        'AC Required: ',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 100.0,
                        child: TextField(),
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
                      Text(
                        'Weight (Kg/Lbs): ',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 100.0,
                        child: Text(
                            "${ProductConfiguration.selectedConfiguration != null ? ProductConfiguration.selectedConfiguration!.weigh_per_module * ProductConfiguration.resolution_height_count * ProductConfiguration.resolution_width_count * 2.20462 : 0}"),
                      ),
                      Text(
                        '# of Sending Box: ',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 100.0,
                        child: TextField(),
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
}
