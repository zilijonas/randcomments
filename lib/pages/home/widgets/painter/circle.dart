import 'dart:math' as math;

import 'package:flutter/material.dart';

class Circle {
  final double x;
  final double y;
  final double radius;
  Circle(this.x, this.y, this.radius);
}

Circle generateCircle(Size size) {
  final x = (math.Random.secure().nextInt((size.width.toInt() + 100)) - 50)
      .toDouble();
  final y = (math.Random.secure().nextInt((size.height.toInt() + 100)) - 50)
      .toDouble();
  final r = (math.Random.secure().nextInt(80)).toDouble();
  return Circle(x, y, r);
}

List<Circle> circlesList(int count, Size size) =>
    List<Circle>.generate(count, (_) => generateCircle(size));
