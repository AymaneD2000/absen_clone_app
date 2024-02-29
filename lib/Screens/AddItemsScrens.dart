import 'package:absens_clone_app/Models/products.dart';
import 'package:absens_clone_app/main.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final TextEditingController horizontalPanelPixelController =
      TextEditingController();
  final TextEditingController dataRunsController = TextEditingController();
  final TextEditingController modulePowerController = TextEditingController();
  final TextEditingController btightnesController = TextEditingController();
  final TextEditingController usageFactorController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController verticalPanelPixelController =
      TextEditingController();
  final TextEditingController resolutionHeightController =
      TextEditingController();
  final TextEditingController resolutionWidthController =
      TextEditingController();
  final TextEditingController totalPixelController = TextEditingController();
  final TextEditingController aspectRatioWController = TextEditingController();
  final TextEditingController aspectRatioHController = TextEditingController();
  final TextEditingController pixelPerPouceController = TextEditingController();
  final TextEditingController powerConsumptionController =
      TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController maxPixelsPerPortController =
      TextEditingController();
  final TextEditingController maxResolutionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel and Processor Input'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Panel Information',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10.0),
            buildInputField('Product name', nameController),
            buildInputField(
                'Horizontal Panel Pixel', horizontalPanelPixelController),
            buildInputField(
                'Vertical Panel Pixel', verticalPanelPixelController),
            buildInputField('Resolution Height', resolutionHeightController),
            buildInputField('Resolution Width', resolutionWidthController),
            //1buildInputField('Total Pixel Count', totalPixelController),
            buildInputField('Module Power', modulePowerController),
            buildInputField('Usage Factor', usageFactorController),
            buildInputField('Brithness', btightnesController),
            buildInputField('Data Runs', dataRunsController),
            buildInputField('Aspect Ratio (W)', aspectRatioWController),
            buildInputField('Aspect Ratio (H)', aspectRatioHController),
            buildInputField('Pixel per pouce', pixelPerPouceController),
            buildInputField(
                'Power Consumption (max)', powerConsumptionController),
            //buildInputField('Weight', weightController),
            const SizedBox(height: 20.0),
            const Text('Processor or Sending Card Information',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10.0),
            buildInputField(
                'Maximum Pixels per Sending Port', maxPixelsPerPortController),
            buildInputField('Maximum Resolution', maxResolutionController),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Handle button press here
                setState(() {
                  Product p = Product(
                      dataruns: int.parse(dataRunsController.text),
                      name: nameController.text,
                      aspect_ratio_w: double.parse(aspectRatioWController.text),
                      aspect_ratio_h: double.parse(aspectRatioHController.text),
                      brightness: double.parse(btightnesController.text),
                      modulePower: double.parse(modulePowerController.text),
                      usageFactor: double.parse(usageFactorController.text),
                      panel_pix_h:
                          int.parse(horizontalPanelPixelController.text),
                      maximum_pixel_per_sending_port:
                          double.parse(maxPixelsPerPortController.text),
                      maximun_resolution:
                          double.parse(maxResolutionController.text),
                      power_consumption_max: powerConsumptionController.text,
                      resolution_height:
                          int.parse(resolutionHeightController.text),
                      resolution_width:
                          int.parse(resolutionWidthController.text),
                      panel_px_w: int.parse(verticalPanelPixelController.text),
                      pixel_per_pouce:
                          double.parse(pixelPerPouceController.text),
                      weigh: 0);
                  MyHomePage.produits.add(p);
                });
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInputField(String labelText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
