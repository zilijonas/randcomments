import 'package:flutter/material.dart';
import 'package:randcomments/theme/colors.dart';

class TextStyles {
  static final pageTitle = TextStyle(color: ThemeColors.white, fontSize: 36);
  static final returnHint = TextStyle(color: ThemeColors.white, fontSize: 18);
  static final listItemDateTime =
      TextStyle(fontSize: 10, color: ThemeColors.grey);
  static final input = TextStyle(fontSize: 24, color: ThemeColors.black);
  static final inputLoadingText =
      TextStyle(color: ThemeColors.white, fontSize: 18);

  static listItemContent(textLength) =>
      TextStyle(fontSize: textLength > 50 ? 18 : 24);
}
