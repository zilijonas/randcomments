import 'package:flutter/material.dart';

class ThemeColors {
  static final splashColor = Colors.lightBlue[100];
  static final accentColor = Colors.white;
  static final lightBlue = Colors.lightBlue[100];
  static final blue = Colors.lightBlueAccent[200];
  static final darkBlue = Colors.lightBlue[600];
  static final green = Colors.lightGreen;
  static final red = Colors.red[400];
  static final white = Colors.white;
  static final black = Colors.black;
  static final shadowBlack = Colors.black.withOpacity(0.3);
  static final grey = Colors.black45;

  static inputFill(bool disabled) =>
      ThemeColors.white.withOpacity(disabled ? 0.35 : 0.75);
}
