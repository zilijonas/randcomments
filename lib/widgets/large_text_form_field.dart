import 'package:flutter/material.dart';
import 'package:randcomments/theme/colors.dart';
import 'package:randcomments/theme/orientation.dart';
import 'package:randcomments/theme/text_styles.dart';

class LargeTextFormField extends StatelessWidget {
  final String _error;
  final void Function(String) _onChanged;
  final String _initialValue;
  final bool _loading;

  LargeTextFormField(this._error, this._onChanged, this._initialValue,
      [this._loading = false]);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Container(
            margin: const EdgeInsets.all(8.0),
            child: TextFormField(
              enabled: !_loading,
              scrollPadding: EdgeInsets.zero,
              autocorrect: false,
              minLines: isPortrait(context) ? 10 : 5,
              maxLines: isPortrait(context) ? 10 : 5,
              style: TextStyles.input,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: ThemeColors.inputFill(_loading),
                  border: _inputBorder(ThemeColors.white),
                  enabledBorder: _inputBorder(ThemeColors.white, 1),
                  errorBorder: _inputBorder(ThemeColors.red, 1),
                  focusedBorder: _inputBorder(ThemeColors.white, 1),
                  disabledBorder: _inputBorder(ThemeColors.white),
                  contentPadding: const EdgeInsets.all(16)),
              initialValue: _initialValue,
              validator: (value) =>
                  (value.trim().isEmpty || value.trim() == _initialValue)
                      ? _error
                      : null,
              onChanged: _onChanged,
            )),
        if (_loading) CircularProgressIndicator()
      ],
    );
  }

  OutlineInputBorder _inputBorder(Color color, [double width = 0]) =>
      OutlineInputBorder(
          borderSide: BorderSide(width: width, color: color),
          borderRadius: BorderRadius.circular(16));
}
