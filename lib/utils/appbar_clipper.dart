import 'package:flutter/material.dart';

class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    var path = Path();
    path.lineTo(0, height);
    path.cubicTo(
      width * 0.50,
      height * 0.1,
      width * 0.70,
      height ,
      width,
      height,
    );
    path.lineTo(
      width,
      height,
    );

    path.lineTo(width, 0);

    // path.quadraticBezierTo(width , height * 0.50, size.width / 2, 100);
    // path.quadraticBezierTo(3 / 4 * size.width, 150, size.width, 170);
    // path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
