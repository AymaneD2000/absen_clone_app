import 'package:absens_clone_app/Models/SendingBox.dart';
import 'package:absens_clone_app/Models/products.dart';
import 'package:get/get.dart';

class ProductConfigurations extends GetxController {
  static List<SendingBox> selectedBox = <SendingBox>[].obs;
  static List<Product> selectedConfiguration = <Product>[].obs;
  static int resolution_width_count = 0.obs.value;
  static int resolution_height_count = 0.obs.value;
  static int resolution_width = 0.obs.value;
  static int resolution_height = 0.obs.value;
}
