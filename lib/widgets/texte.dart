import 'package:absens_clone_app/widgets/fonts.dart';
import 'package:flutter/material.dart';

class WText extends StatelessWidget {
  final String? text;
  final double? size;
  final Color? color;
  final FontStyle? style;
  final FontWeight? weight;
  final TextOverflow? overflow;
  final int? maxl;
  final TextAlign? textAlign;
  const WText(this.text,
      {super.key,
      this.size,
      this.color,
      this.style,
      this.weight,
      this.overflow,
      this.maxl,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(text ?? "",
        style: SafeGoogleFont("League Spartan",
            fontStyle: style,
            fontSize: size ?? 16.5,
            color: color ?? Colors.black54,
            fontWeight: weight ?? FontWeight.normal));
  }
}
