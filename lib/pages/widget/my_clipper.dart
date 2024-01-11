import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 170);
    path.quadraticBezierTo(size.width / 5, 50 /*180*/, size.width / 2, 100);
    path.quadraticBezierTo(3 / 4 * size.width, 150, size.width, 170);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
