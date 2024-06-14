
import 'package:flutter/cupertino.dart';

class MilkDropClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.quadraticBezierTo(5, 10, 5, 20);
    path.quadraticBezierTo(5, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - 5, size.height, size.width - 5, size.height - 20);
    path.quadraticBezierTo( size.width - 5, 10, size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}