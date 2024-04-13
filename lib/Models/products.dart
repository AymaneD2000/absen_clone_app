import 'dart:ffi';

class Product {
  int? id;
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
      this.id,
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
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dataruns': dataruns,
      'usageFactor': usageFactor,
      'modulePower': modulePower,
      'brightness': brightness,
      'aspect_ratio_w': aspect_ratio_w,
      'aspect_ratio_h': aspect_ratio_h,
      'diagonal_mesurement': diagonal_mesurement,
      'panel_pix_h': panel_pix_h,
      'maximum_pixel_per_sending_port': maximum_pixel_per_sending_port,
      'maximun_resolution': maximun_resolution,
      'power_consumption_max': power_consumption_max,
      'resolution_height': resolution_height,
      'resolution_width': resolution_width,
      'resolution_size': resolution_size,
      'panel_px_w': panel_px_w,
      'pixel_per_pouce': pixel_per_pouce,
      'weigh_per_module': weigh_per_module,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      dataruns: json['dataruns'],
      usageFactor: json['usageFactor'],
      modulePower: json['modulePower'],
      brightness: json['brightness'],
      aspect_ratio_w: json['aspect_ratio_w'],
      aspect_ratio_h: json['aspect_ratio_h'],
      diagonal_mesurement: json['diagonal_mesurement'],
      panel_pix_h: json['panel_pix_h'],
      maximum_pixel_per_sending_port: json['maximum_pixel_per_sending_port'],
      maximun_resolution: json['maximun_resolution'],
      power_consumption_max: json['power_consumption_max'],
      resolution_height: json['resolution_height'],
      resolution_width: json['resolution_width'],
      resolution_size: json['resolution_size'],
      panel_px_w: json['panel_px_w'],
      pixel_per_pouce: json['pixel_per_pouce'],
      weigh_per_module: json['weigh_per_module'],
    );
  }
}
