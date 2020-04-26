import 'package:flutter/material.dart';
import 'package:randcomments/theme/colors.dart';

class TextStyles {
  static final pageTitle = TextStyle(
      color: ThemeColors.white,
      fontSize: 36,
      fontWeight: FontWeight.w500,
      shadows: _textShadows);
  static final returnHint =
      TextStyle(color: ThemeColors.white, fontSize: 18, shadows: _textShadows);
  static final listItemDateTime =
      TextStyle(fontSize: 10, color: ThemeColors.grey);
  static final input = TextStyle(fontSize: 24, color: ThemeColors.black);
  static final inputLoadingText =
      TextStyle(color: ThemeColors.white, fontSize: 18, shadows: _textShadows);
  static final emptyListHint = TextStyle(
      color: ThemeColors.white,
      fontSize: 24,
      fontWeight: FontWeight.w500,
      shadows: _textShadows);

  static listItemContent(textLength) =>
      TextStyle(fontSize: textLength > 50 ? 18 : 24);

  static final List<Shadow> _textShadows = [
    Shadow(
      color: ThemeColors.shadowBlack,
      offset: Offset(0, 1),
      blurRadius: 4,
    )
  ];
}
