import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final IconData _icon;
  final Color _color;
  final void Function() _onPressed;
  final bool _loading;

  ActionButton(this._icon, this._color, this._onPressed,
      [this._loading = false]);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        minWidth: 72.0,
        height: 72.0,
        child: RaisedButton(
          color: _loading ? Colors.grey[400] : _color,
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(36)),
          child: _loading
              ? SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(strokeWidth: 2))
              : Icon(
                  _icon,
                  color: Colors.white,
                  size: 36,
                ),
          onPressed: _onPressed,
        ));
  }
}
