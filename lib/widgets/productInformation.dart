import 'dart:math';

import 'package:absens_clone_app/Models/SendingBox.dart';
import 'package:absens_clone_app/Models/products.dart';
import 'package:absens_clone_app/main.dart';
import 'package:absens_clone_app/widgets/getX.dart';
import 'package:flutter/material.dart';

class ProductConfiguration extends StatefulWidget {
  const ProductConfiguration({Key? key}) : super(key: key);
  @override
  State<ProductConfiguration> createState() => _ProductConfigurationState();
}

class _ProductConfigurationState extends State<ProductConfiguration> {
  String? _selectedProduct;
  final List<Product> _products = MyHomePage.produits;
  //final List<Product> _configurations = MyHomePage.produits;
  final List<SendingBox> _boxes = MyHomePage.boxs;

  void _onProductChanged(String? newProduct) {
    setState(() {
      _selectedProduct = newProduct;
    });
  }

  void _onBoxChanged(SendingBox? newProduct) {
    setState(() {
      newProduct != null
          ? ProductConfigurations.selectedBox.add(newProduct)
          : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    _buildDropdown("Select Product :", _selectedProduct,
                        _products, _onProductChanged)
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
                        _products),
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
                    _buildQuantitySectionHorizontale("Horizontal Qty:"),
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
                    _buildQuantitySectionVerticale("Vertical Qty:"),
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
              child: const Text("Data sending Port"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, String? value, List<Product> items,
      ValueChanged<String?> onChanged) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
              fontSize: MediaQuery.of(context).textScaler.scale(16),
              fontWeight: FontWeight.bold),
        ),
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
    );
  }

  Widget _buildDropdownConfiguration(
      String label, Product? value, List<Product> items) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
              fontSize: MediaQuery.of(context).textScaler.scale(16),
              fontWeight: FontWeight.bold),
        ),
        DropdownButton<Product>(
          value: value,
          onChanged: (values) {
            setState(() {
              ProductConfigurations.selectedConfiguration.clear();
              values != null
                  ? ProductConfigurations.selectedConfiguration.add(values)
                  : 0;
              ProductConfigurations.resolution_height = 0;
              ProductConfigurations.resolution_width = 0;
              ProductConfigurations.resolution_height_count = 0;
              ProductConfigurations.resolution_width_count = 0;
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
    );
  }

  Widget _buildDropdownBox(String label, SendingBox? value,
      List<SendingBox> items, ValueChanged<SendingBox?> onChanged) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
              fontSize: MediaQuery.of(context).textScaler.scale(16),
              fontWeight: FontWeight.bold),
        ),
        DropdownButton<SendingBox>(
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
    );
  }

  Widget _buildQuantitySectionHorizontale(String label) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.999,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).textScaler.scale(16),
                  fontWeight: FontWeight.bold),
            ),
            IconButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red)),
              onPressed: () {
                ProductConfigurations.selectedConfiguration.isEmpty
                    ? 0
                    : setState(() {
                        ProductConfigurations.resolution_width_count > 0
                            ? ProductConfigurations.resolution_width_count--
                            : ProductConfigurations.resolution_width_count;
                        var d = ProductConfigurations
                                .selectedConfiguration.first.panel_px_w *
                            ProductConfigurations.resolution_width_count *
                            ProductConfigurations
                                .selectedConfiguration.first.aspect_ratio_w;
                        ProductConfigurations.resolution_width = d.toInt();
                      });
              },
              icon: Icon(Icons.remove,
                  color: Colors.black,
                  size: MediaQuery.of(context).textScaler.scale(18)),
            ),
            SizedBox(
              width: 30.0,
              child: Center(
                child: Text(
                  "${ProductConfigurations.resolution_width_count}",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).textScaler.scale(16),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            IconButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green)),
              onPressed: () {
                ProductConfigurations.selectedConfiguration.isEmpty
                    ? 0
                    : setState(() {
                        ProductConfigurations.resolution_width_count++;
                        var d = ProductConfigurations
                                .selectedConfiguration.first.panel_px_w *
                            ProductConfigurations.resolution_width_count;
                        ProductConfigurations.resolution_width = d.toInt();
                      });
              },
              icon: Icon(Icons.add,
                  color: Colors.black,
                  size: MediaQuery.of(context).textScaler.scale(18)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantitySectionVerticale(String label) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.999,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).textScaler.scale(16),
                  fontWeight: FontWeight.bold),
            ),
            IconButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red)),
              onPressed: () {
                ProductConfigurations.selectedConfiguration.isEmpty
                    ? 0
                    : setState(() {
                        ProductConfigurations.resolution_height_count > 0
                            ? ProductConfigurations.resolution_height_count--
                            : ProductConfigurations.resolution_height_count;
                        var d = ProductConfigurations
                                .selectedConfiguration.first.panel_pix_h *
                            ProductConfigurations.resolution_height_count;
                        ProductConfigurations.resolution_height = d.toInt();
                      });
              },
              icon: Icon(Icons.remove,
                  color: Colors.black,
                  size: MediaQuery.of(context).textScaler.scale(18)),
            ),
            SizedBox(
              width: 30.0,
              child: Center(
                child: Text(
                  "${ProductConfigurations.resolution_height_count}",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).textScaler.scale(16),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            IconButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green)),
              onPressed: () {
                ProductConfigurations.selectedConfiguration.isEmpty
                    ? 0
                    : setState(() {
                        ProductConfigurations.resolution_height_count++;
                        var d = ProductConfigurations
                                .selectedConfiguration.first.panel_pix_h *
                            ProductConfigurations.resolution_height_count;
                        ProductConfigurations.resolution_height = d.toInt();
                      });
              },
              icon: Icon(Icons.add,
                  color: Colors.black,
                  size: MediaQuery.of(context).textScaler.scale(18)),
            ),
          ],
        ),
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
            Text(
              label,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).textScaler.scale(18),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 100,
              child: Text(
                "$width",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).textScaler.scale(16)),
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
            Text(
              label,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).textScaler.scale(18),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.80,
                child: Text(
                  "$width",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).textScaler.scale(16)),
                )),
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
            Text(
              label,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).textScaler.scale(18),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
                width: 100,
                child: Text(
                  "  $width : $height",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).textScaler.scale(16)),
                )),
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
            Text(
              label,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).textScaler.scale(18),
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10.0),
            Text(
              widthLabel,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).textScaler.scale(18),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
                width: 80,
                child: Text(
                  "${ProductConfigurations.resolution_width}",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).textScaler.scale(16)),
                )),
            const SizedBox(width: 10.0),
            Text(
              heightLabel,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).textScaler.scale(18),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
                width: 80,
                child: Text("${ProductConfigurations.resolution_height}",
                    style: TextStyle(
                        fontSize:
                            MediaQuery.of(context).textScaler.scale(16)))),
            const SizedBox(width: 10.0),
            Text(
              sizeLabel,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).textScaler.scale(18),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
                width: 80,
                child: Text(
                    "${ProductConfigurations.resolution_height * ProductConfigurations.resolution_width}",
                    style: TextStyle(
                        fontSize:
                            MediaQuery.of(context).textScaler.scale(16)))),
          ],
        ),
      ),
    );
  }
}
