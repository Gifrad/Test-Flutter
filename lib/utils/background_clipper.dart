import 'package:flutter/material.dart';

class BackgroundClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var p = Path();

    p.lineTo(0, height);

    p.lineTo(width / 4, height);

    p.cubicTo(
      width,
      height * 0.90,
      width * 0.40,
      height * 0.50,
      width,
      height / 3,
    );

    p.lineTo(width, 0);

    p.close();

    return p;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
