import 'package:arrow_path/arrow_path.dart';
import 'package:flutter/material.dart';
import 'package:randcomments/theme/colors.dart';
import 'package:randcomments/theme/text_styles.dart';

class ArrowPainter extends CustomPainter {
  final String _text;
  ArrowPainter(this._text);

  final _shadowBrush = Paint()
    ..color = ThemeColors.black.withOpacity(0.2)
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.fill
    ..strokeWidth = 8;

  final _brush = Paint()
    ..color = ThemeColors.white
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round
    ..strokeWidth = 4.0;

  @override
  void paint(Canvas canvas, Size size) {
    _drawText(canvas, size);
    _drawArrow(canvas, size);
  }

  void _drawText(Canvas canvas, Size size) => TextPainter(
        text: TextSpan(text: _text, style: TextStyles.emptyListHint),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      )
        ..layout(minWidth: size.width)
        ..paint(canvas, Offset(0, size.height * 0.45));

  void _drawArrow(Canvas canvas, Size size) => canvas.drawPath(
      ArrowPath.make(
          path: Path()
            ..moveTo(size.width * 0.49, size.height * 0.61)
            ..cubicTo(
              size.width * 0.5,
              size.height * 0.7,
              size.width * 0.6,
              size.height * 0.8,
              size.width * 0.8,
              size.height * 0.9,
            )),
      _brush);

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
