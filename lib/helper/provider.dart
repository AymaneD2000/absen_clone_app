import 'package:absens_clone_app/Models/SendingBox.dart';
import 'package:absens_clone_app/Models/products.dart';
import 'package:absens_clone_app/widgets/getX.dart';
import 'package:flutter/cupertino.dart';

class MyProvider extends ChangeNotifier {
  List<SendingBox> selectedBox = [];
  List<Product> selectedConfiguration = [];
  int resolution_width_count = 0;
  int resolution_height_count = 0;
  int resolution_width = 0;
  int resolution_height = 0;

  String? selectedProduct;
  void onProductChanged(String? newProduct) {
    print("CLique");
    selectedProduct = newProduct;
    notifyListeners();
  }

  void verticalCalculPlus() {
    ProductConfigurations.selectedConfiguration.isEmpty
        ? 0
        : ProductConfigurations.resolution_height_count++;
    resolution_height_count++;
    int d = 0;
    ProductConfigurations.selectedConfiguration.isEmpty
        ? 0
        : d = ProductConfigurations.selectedConfiguration.first.panel_pix_h *
            ProductConfigurations.resolution_height_count;
    ProductConfigurations.resolution_height = d.toInt();
    var dpro = selectedConfiguration.isNotEmpty
        ? selectedConfiguration.first.panel_pix_h * resolution_height_count
        : 0;
    resolution_height = dpro.toInt();

    print("Reso");
    print(resolution_height);
    notifyListeners();
  }

  void verticalCalculMoin() async {
    ProductConfigurations.selectedConfiguration.isEmpty
        ? 0
        : ProductConfigurations.resolution_height_count > 0
            ? ProductConfigurations.resolution_height_count--
            : ProductConfigurations.resolution_height_count;
    int d = 0;
    ProductConfigurations.selectedConfiguration.isEmpty
        ? 0
        : d = ProductConfigurations.selectedConfiguration.first.panel_pix_h *
            ProductConfigurations.resolution_height_count;
    ProductConfigurations.resolution_height = d.toInt();

    resolution_height_count > 0
        ? resolution_height_count--
        : resolution_height_count;
    var dpro = selectedConfiguration.isNotEmpty
        ? selectedConfiguration.first.panel_pix_h * resolution_height_count
        : 0;
    resolution_height = dpro.toInt();
    notifyListeners();
  }

  void horizCalculMoin() {
    ProductConfigurations.selectedConfiguration.isEmpty
        ? 0
        : ProductConfigurations.resolution_width_count > 0
            ? ProductConfigurations.resolution_width_count--
            : ProductConfigurations.resolution_width_count;

    selectedConfiguration.isEmpty
        ? 0
        : resolution_width_count > 0
            ? resolution_width_count--
            : resolution_width_count;

    double d = 0;
    ProductConfigurations.selectedConfiguration.isEmpty
        ? 0
        : d = ProductConfigurations.selectedConfiguration.first.panel_px_w *
            ProductConfigurations.resolution_width_count *
            ProductConfigurations.selectedConfiguration.first.aspect_ratio_w;
    ProductConfigurations.resolution_width = d.toInt();

    var dpro = selectedConfiguration.isNotEmpty
        ? selectedConfiguration.first.panel_px_w *
            resolution_width_count *
            selectedConfiguration.first.aspect_ratio_w
        : 0;
    resolution_width = dpro.toInt();

    notifyListeners();
  }

  void horizCalculPlus() {
    ProductConfigurations.selectedConfiguration.isEmpty
        ? 0
        : {
            resolution_width_count++,
            ProductConfigurations.resolution_width_count++
          };
    int d = 0;
    ProductConfigurations.selectedConfiguration.isEmpty
        ? 0
        : d = ProductConfigurations.selectedConfiguration.first.panel_px_w *
            ProductConfigurations.resolution_width_count;
    ProductConfigurations.resolution_width = d.toInt();
    print(resolution_height);
    var dpro = selectedConfiguration.isNotEmpty
        ? selectedConfiguration.first.panel_px_w * resolution_width_count
        : 0;
    resolution_width = dpro.toInt();
    notifyListeners();
  }
}
