import 'package:flutter/material.dart';
import 'package:randcomments/theme/colors.dart';

import 'circle.dart';

class CirclesPainter extends CustomPainter {
  final List<Circle> _circles;
  CirclesPainter(this._circles);

  final _fill = Paint()
    ..color = ThemeColors.blue
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.fill
    ..strokeWidth = 30;

  final _brush = Paint()
    ..color = ThemeColors.white.withOpacity(0.2)
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.fill
    ..strokeWidth = 30;

  void _drawCircle(Canvas canvas, double x, double y, double radius) =>
      canvas.drawCircle(Offset(x, y), radius, _brush);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRRect(
        RRect.fromLTRBR(0, 0, size.width, size.height, Radius.zero), _fill);
    _circles.forEach((c) => _drawCircle(canvas, c.x, c.y, c.radius));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
