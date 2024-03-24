import 'dart:math';

import 'package:absens_clone_app/Models/SendingBox.dart';
import 'package:absens_clone_app/Models/products.dart';
import 'package:absens_clone_app/helper/provider.dart';
import 'package:absens_clone_app/main.dart';
import 'package:absens_clone_app/widgets/getX.dart';
import 'package:absens_clone_app/widgets/texte.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class ProductConfiguration extends StatefulWidget {
  const ProductConfiguration({Key? key}) : super(key: key);
  @override
  State<ProductConfiguration> createState() => _ProductConfigurationState();
}

class _ProductConfigurationState extends State<ProductConfiguration> {
  final List<Product> _products = MyHomePage.produits;
  final List<SendingBox> _boxes = MyHomePage.boxs;

  void _onProductChanged(String? newProduct) {
    setState(() {
    });
    MyProvider().onProductChanged(newProduct);
  }

  void _onBoxChanged(SendingBox? newProduct) {
    setState(() {
      newProduct != null
          ? ProductConfigurations.selectedBox.add(newProduct)
          : 0;
    });
  }

  late MyProvider provider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<MyProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(builder: (context, data, child) {
      return SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Product Configuration",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).textScaler.scale(20),
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9999,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildDropdown("Select Product :", data.selectedProduct,
                        _products, data.onProductChanged)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9999,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildDropdownConfiguration(
                        "Configuration :",
                        ProductConfigurations.selectedConfiguration.isEmpty
                            ? null
                            : ProductConfigurations.selectedConfiguration.first,
                        _products,
                        provider),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.999,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildQuantitySectionHorizontale(
                        "Horizontal Qty:", provider),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.999,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildQuantitySectionVerticale("Vertical Qty:", provider),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.999,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: _buildTextFieldRow(
                    "Panel Pix (W) :",
                    ProductConfigurations.selectedConfiguration.isEmpty
                        ? 0
                        : ProductConfigurations
                            .selectedConfiguration.first.panel_px_w),
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.999,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: _buildTextFieldRow(
                    "Panel Pix (H) :",
                    ProductConfigurations.selectedConfiguration.isEmpty
                        ? 0
                        : ProductConfigurations
                            .selectedConfiguration.first.panel_pix_h),
              ),
            ),
            const SizedBox(height: 10.0),
            _buildResolutionRow("Resolution", "Width :", "Height :", "Size :"),
            const SizedBox(height: 10.0),
            _buildTextFieldRowRatio(
                "Aspect Ratio (W:H) :",
                ProductConfigurations.selectedConfiguration.isEmpty
                    ? 0
                    : ProductConfigurations
                        .selectedConfiguration.first.aspect_ratio_w,
                ProductConfigurations.selectedConfiguration.isEmpty
                    ? 0
                    : ProductConfigurations
                        .selectedConfiguration.first.aspect_ratio_w),
            const SizedBox(height: 10.0),
            _buildTextFieldRowDiagonale(
                "Diagonale :",
                ProductConfigurations.resolution_height == 0 ||
                        ProductConfigurations.resolution_width == 0
                    ? 0
                    : (sqrt(pow(ProductConfigurations.resolution_height, 2) +
                            pow(ProductConfigurations.resolution_width, 2)) *
                        1 /
                        334 *
                        0.0254)),
            const SizedBox(height: 10.0),
            _buildDropdownBox(
                "Sending Box :",
                ProductConfigurations.selectedBox.isNotEmpty
                    ? ProductConfigurations.selectedBox.first
                    : null,
                _boxes,
                _onBoxChanged),
            const SizedBox(height: 20.0),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: const WText("Data sending Port"),
            ),
          ],
        ),
      ));
    });
  }

  Widget _buildDropdown(String label, String? value, List<Product> items,
      ValueChanged<String?> onChanged) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            WText(label,
                size: MediaQuery.of(context).textScaler.scale(16),
                weight: FontWeight.bold,
                color: Color.fromARGB(255, 118, 14, 121)),
            Gap(50),
            DropdownButton<String>(
              value: value,
              onChanged: onChanged,
              items: items.map((Product item) {
                return DropdownMenuItem<String>(
                  value: item.name,
                  child: Text(item.name),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownConfiguration(
      String label, Product? value, List<Product> items, MyProvider pro) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            WText(label,
                color: Color.fromARGB(255, 118, 14, 121),
                size: MediaQuery.of(context).textScaler.scale(16),
                weight: FontWeight.bold),
            Gap(25),
            DropdownButton<Product>(
              value: value,
              onChanged: (values) {
                setState(() {
                  ProductConfigurations.selectedConfiguration.clear();
                  pro.selectedConfiguration.clear();
                  values != null
                      ? ProductConfigurations.selectedConfiguration.add(values)
                      : 0;
                  values != null ? pro.selectedConfiguration.add(values) : 0;
                  ProductConfigurations.resolution_height = 0;
                  ProductConfigurations.resolution_width = 0;
                  ProductConfigurations.resolution_height_count = 0;
                  ProductConfigurations.resolution_width_count = 0;

                  pro.resolution_height = 0;
                  pro.resolution_width = 0;
                  pro.resolution_height_count = 0;
                  pro.resolution_width_count = 0;
                });
              },
              items: items.map((Product item) {
                return DropdownMenuItem<Product>(
                  value: item,
                  child: Text(item.name),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownBox(String label, SendingBox? value,
      List<SendingBox> items, ValueChanged<SendingBox?> onChanged) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            WText(
              label,
              size: MediaQuery.of(context).textScaler.scale(16),
              weight: FontWeight.bold,
              color: Color.fromARGB(255, 118, 14, 121),
            ),
            // Gap(20),
            Spacer(),
            DropdownButton<SendingBox>(
              iconSize: 25,
              value: value,
              onChanged: onChanged,
              items: items.map((SendingBox item) {
                return DropdownMenuItem<SendingBox>(
                  value: item,
                  child: Text(item.boxName),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantitySectionHorizontale(String label, MyProvider pro) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.999,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: configAxQty(label, pro, true),
      ),
    );
  }

  Row configAxQty(String label, MyProvider pro, bool horiz) {
    return Row(
      children: [
        WText(label,
            size: MediaQuery.of(context).textScaler.scale(16),
            color: Color.fromARGB(255, 11, 68, 99),
            weight: FontWeight.bold),
        Gap(15),
        SizedBox(
          width: 30.0,
          child: Center(
            child: WText(
                horiz
                    ? "${ProductConfigurations.resolution_width_count}"
                    : "${ProductConfigurations.resolution_height_count}",
                size: MediaQuery.of(context).textScaler.scale(16),
                weight: FontWeight.bold),
          ),
        ),
        Gap(15),
        IconButton(
          style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 193, 15, 2))),
          onPressed: () {
            if (horiz) {
              pro.horizCalculMoin();
            } else {
              pro.verticalCalculMoin();
            }
          },
          icon: Icon(Icons.remove,
              color: Colors.white,
              size: MediaQuery.of(context).textScaler.scale(18)),
        ),
        Gap(15),
        IconButton(
          style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 2, 147, 7))),
          onPressed: () {
            if (horiz) {
              pro.horizCalculPlus();
            } else {
              pro.verticalCalculPlus();
            }
          },
          icon: Icon(Icons.add,
              color: Colors.white,
              size: MediaQuery.of(context).textScaler.scale(18)),
        ),
      ],
    );
  }

  Widget _buildQuantitySectionVerticale(String label, MyProvider prov) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.999,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: configAxQty(label, prov, false)
      ),
    );
  }

  Widget _buildTextFieldRow(String label, int width) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.999,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            WText(label,
                size: MediaQuery.of(context).textScaler.scale(18),
                weight: FontWeight.bold,
                color: Color.fromARGB(255, 11, 68, 99)),
            Gap(20),
            SizedBox(
              width: 100,
              child: WText(
                "$width",
                size: MediaQuery.of(context).textScaler.scale(16),
                weight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldRowDiagonale(String label, double width) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            WText(label,
                size: MediaQuery.of(context).textScaler.scale(18),
                weight: FontWeight.bold,
                color: Color.fromARGB(255, 11, 68, 99)),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.80,
              child: WText("$width",
                  size: MediaQuery.of(context).textScaler.scale(16)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldRowRatio(String label, double width, double height) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.999,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            WText(label,
                size: MediaQuery.of(context).textScaler.scale(18),
                weight: FontWeight.bold,
                color: Color.fromARGB(255, 11, 68, 99)),
            SizedBox(
              width: 100,
              child: WText("  $width : $height",
                  weight: FontWeight.bold,
                  size: MediaQuery.of(context).textScaler.scale(16)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResolutionRow(
      String label, String widthLabel, String heightLabel, String sizeLabel) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9999,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            WText(label,
                size: MediaQuery.of(context).textScaler.scale(18),
                weight: FontWeight.bold,
                color: Color.fromARGB(255, 11, 68, 99)),
            const SizedBox(width: 10.0),
            WText(widthLabel,
                size: MediaQuery.of(context).textScaler.scale(18),
                weight: FontWeight.bold),
            SizedBox(
              width: 80,
              child: WText(" ${ProductConfigurations.resolution_width}",
                  size: MediaQuery.of(context).textScaler.scale(16)),
            ),
            const SizedBox(width: 10.0),
            WText(heightLabel,
                size: MediaQuery.of(context).textScaler.scale(18),
                weight: FontWeight.bold),
            SizedBox(
                width: 80,
                child: WText(" ${ProductConfigurations.resolution_height}",
                    size: MediaQuery.of(context).textScaler.scale(16))),
            const SizedBox(width: 10.0),
            WText(sizeLabel,
                size: MediaQuery.of(context).textScaler.scale(18),
                weight: FontWeight.bold),
            SizedBox(
                width: 80,
                child: WText(
                    "${ProductConfigurations.resolution_height * ProductConfigurations.resolution_width}",
                    size: MediaQuery.of(context).textScaler.scale(16))),
          ],
        ),
      ),
    );
  }
}
