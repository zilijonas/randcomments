import 'package:flutter/material.dart';
import 'package:randcomments/theme/colors.dart';

class TextStyles {
  static final pageTitle = TextStyle(color: ThemeColors.white, fontSize: 36);
  static final returnHint = TextStyle(color: ThemeColors.white);
  static final listItemDateTime =
      TextStyle(fontSize: 10, color: ThemeColors.grey);
  static final input = TextStyle(fontSize: 24, color: ThemeColors.black);

  static listItemContent(textLength) =>
      TextStyle(fontSize: textLength > 50 ? 18 : 24);
}
