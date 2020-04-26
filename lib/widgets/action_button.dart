import 'package:flutter/material.dart';
import 'package:randcomments/theme/colors.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final void Function() onPressed;
  final bool disabled;

  ActionButton(
      {@required this.icon,
      @required this.color,
      @required this.onPressed,
      this.disabled = false});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        minWidth: 72.0,
        height: 72.0,
        child: RaisedButton(
          disabledColor: color.withOpacity(0.8),
          color: color,
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(36)),
          child: Icon(icon, color: ThemeColors.white, size: 36),
          onPressed: disabled ? null : onPressed,
        ));
  }
}
