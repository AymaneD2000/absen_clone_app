import 'dart:math';

import 'package:absens_clone_app/Models/SendingBox.dart';
import 'package:absens_clone_app/Models/products.dart';
import 'package:absens_clone_app/Screens/displayInformation.dart';
import 'package:absens_clone_app/helper/provider.dart';
import 'package:absens_clone_app/widgets/texte.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class ProductConfiguration extends StatefulWidget {
  const ProductConfiguration({Key? key}) : super(key: key);
  @override
  State<ProductConfiguration> createState() => _datatate();
}

class _datatate extends State<ProductConfiguration> {
  List<Product> _products = [];
  List<SendingBox> _boxes = [];

  void _onBoxChanged(SendingBox? newProduct) {
    setState(() {
      if (newProduct != null) {
        provider.selectedBox.clear();
        provider.selectedBox.add(newProduct);
      }
      //newProduct != null ?  : 0;
    });
  }

  getAll() async {
    while (_products.isEmpty || _boxes.isEmpty) {
      await provider.getProduct();
      await provider.getSendinBox();
      setState(() {
        _products = provider.produit;
        _boxes = provider.box;
      });
    }
  }

  late MyProvider provider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<MyProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {});
    provider.getProduct();
    provider.getSendinBox();
    _boxes = provider.box;
    _products = provider.produit;
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      getAll();
    });

    return Consumer<MyProvider>(builder: (context, data, child) {
      return SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DisplayInformation(),
            Gap(12),
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
                    _buildDropdownConfiguration(
                        "Product :",
                        data.selectedConfiguration.isEmpty
                            ? null
                            : data.selectedConfiguration.first,
                        _products,
                        data),
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
                    data.selectedConfiguration.isEmpty
                        ? 0
                        : data.selectedConfiguration.first.panel_px_w),
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.999,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: _buildTextFieldRow(
                    "Panel Pix (H) :",
                    data.selectedConfiguration.isEmpty
                        ? 0
                        : data.selectedConfiguration.first.panel_pix_h),
              ),
            ),
            const SizedBox(height: 10.0),
            _buildResolutionRow(
                "Resolution", "Width :", "Height :", "Size :", data),
            const SizedBox(height: 10.0),
            _buildTextFieldRowRatio(
                "Aspect Ratio (W:H) :",
                data.selectedConfiguration.isEmpty
                    ? 0
                    : data.selectedConfiguration.first.aspect_ratio_w,
                data.selectedConfiguration.isEmpty
                    ? 0
                    : data.selectedConfiguration.first.aspect_ratio_w),
            const SizedBox(height: 10.0),
            _buildTextFieldRowDiagonale(
                "Diagonale :",
                data.resolution_height == 0 || data.resolution_width == 0
                    ? 0
                    : (sqrt(pow(data.resolution_height, 2) +
                            pow(data.resolution_width, 2)) *
                        1 /
                        334 *
                        0.0254)),
            const SizedBox(height: 10.0),
            _buildDropdownBox(
                "Sending Unit :",
                data.selectedBox.isNotEmpty ? data.selectedBox.first : null,
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
                color: const Color.fromARGB(255, 118, 14, 121)),
            const Gap(50),
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
                color: const Color.fromARGB(255, 118, 14, 121),
                size: MediaQuery.of(context).textScaler.scale(16),
                weight: FontWeight.bold),
            const Gap(25),
            DropdownButton<Product>(
              value: value,
              onChanged: (values) {
                setState(() {
                  //data.selectedConfiguration.clear();
                  pro.selectedConfiguration.clear();
                  // values != null
                  //     ? data.selectedConfiguration.add(values)
                  //     : 0;
                  if (values != null) {
                    pro.selectedConfiguration.clear();
                    pro.selectedConfiguration.add(values);
                  }

                  // data.resolution_height = 0;
                  // data.resolution_width = 0;
                  // data.resolution_height_count = 0;
                  // data.resolution_width_count = 0;

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
              color: const Color.fromARGB(255, 118, 14, 121),
            ),
            // Gap(20),
            const Spacer(),
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
            color: const Color.fromARGB(255, 11, 68, 99),
            weight: FontWeight.bold),
        const Gap(15),
        SizedBox(
          width: 30.0,
          child: Center(
            child: WText(
                horiz
                    ? "${pro.resolution_height_count}"
                    : "${pro.resolution_width_count}",
                size: MediaQuery.of(context).textScaler.scale(16),
                weight: FontWeight.bold),
          ),
        ),
        const Gap(15),
        IconButton(
          style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 193, 15, 2))),
          onPressed: () {
            if (horiz) {
              pro.verticalCalculMoin();
            } else {
              pro.horizCalculMoin();
            }
          },
          icon: Icon(Icons.remove,
              color: Colors.white,
              size: MediaQuery.of(context).textScaler.scale(18)),
        ),
        const Gap(15),
        IconButton(
          style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 2, 147, 7))),
          onPressed: () {
            if (horiz) {
              pro.verticalCalculPlus();
            } else {
              pro.horizCalculPlus();
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
          child: configAxQty(label, prov, false)),
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
                color: const Color.fromARGB(255, 11, 68, 99)),
            const Gap(20),
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
                color: const Color.fromARGB(255, 11, 68, 99)),
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
                color: const Color.fromARGB(255, 11, 68, 99)),
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

  Widget _buildResolutionRow(String label, String widthLabel,
      String heightLabel, String sizeLabel, MyProvider data) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9999,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            WText(label,
                size: MediaQuery.of(context).textScaler.scale(18),
                weight: FontWeight.bold,
                color: const Color.fromARGB(255, 11, 68, 99)),
            const SizedBox(width: 10.0),
            WText(widthLabel,
                size: MediaQuery.of(context).textScaler.scale(18),
                weight: FontWeight.bold),
            SizedBox(
              width: 80,
              child: WText(" ${data.resolution_width}",
                  size: MediaQuery.of(context).textScaler.scale(16)),
            ),
            const SizedBox(width: 10.0),
            WText(heightLabel,
                size: MediaQuery.of(context).textScaler.scale(18),
                weight: FontWeight.bold),
            SizedBox(
                width: 80,
                child: WText(" ${data.resolution_height}",
                    size: MediaQuery.of(context).textScaler.scale(16))),
            const SizedBox(width: 10.0),
            WText(sizeLabel,
                size: MediaQuery.of(context).textScaler.scale(18),
                weight: FontWeight.bold),
            SizedBox(
                width: 80,
                child: WText(
                    "${data.resolution_height * data.resolution_width}",
                    size: MediaQuery.of(context).textScaler.scale(16))),
          ],
        ),
      ),
    );
  }
}
