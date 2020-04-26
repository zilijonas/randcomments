import 'package:flutter/material.dart';
import 'package:randcomments/theme/colors.dart';

import 'circle.dart';

class CirclesPainter extends CustomPainter {
  Paint _brush(Color color) => Paint()
    ..color = color
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.fill
    ..strokeWidth = 30;

  void _drawCircle(Canvas canvas, double x, double y, double radius) =>
      canvas.drawCircle(
          Offset(x, y), radius, _brush(ThemeColors.white.withOpacity(0.2)));

  @override
  void paint(Canvas canvas, Size size) {
    circlesList(15, size)
        .forEach((c) => _drawCircle(canvas, c.x, c.y, c.radius));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
