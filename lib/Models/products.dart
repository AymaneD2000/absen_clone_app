import 'dart:ffi';

class Product {
  String name;
  int panel_pix_h;
  int panel_px_w;
  int dataruns;
  int resolution_height;
  int resolution_width;
  int? resolution_size;
  double aspect_ratio_w;
  double aspect_ratio_h;
  double? diagonal_mesurement;
  double pixel_per_pouce;
  String power_consumption_max;
  double weigh_per_module;
  double modulePower;
  double usageFactor;
  double brightness;
  double maximum_pixel_per_sending_port;
  double maximun_resolution;
  Product(
      {required this.name,
      required this.dataruns,
      required this.usageFactor,
      required this.modulePower,
      required this.brightness,
      required this.aspect_ratio_w,
      required this.aspect_ratio_h,
      this.diagonal_mesurement,
      required this.panel_pix_h,
      required this.maximum_pixel_per_sending_port,
      required this.maximun_resolution,
      required this.power_consumption_max,
      required this.resolution_height,
      required this.resolution_width,
      this.resolution_size,
      required this.panel_px_w,
      required this.pixel_per_pouce,
      required this.weigh_per_module});
}
