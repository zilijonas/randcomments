import 'package:flutter/material.dart';
import 'package:randcomments/theme/colors.dart';
import 'package:randcomments/theme/orientation.dart';
import 'package:randcomments/theme/text_styles.dart';

class LargeTextFormField extends StatefulWidget {
  final String error;
  final void Function(String) onChanged;
  final String initialValue;
  final bool loading;
  final String loadingMessage;
  final bool editable;
  final void Function(bool) onEditableChecked;

  LargeTextFormField(
      {@required this.error,
      @required this.onChanged,
      @required this.initialValue,
      @required this.editable,
      @required this.onEditableChecked,
      this.loading = false,
      this.loadingMessage = 'Loading...'});

  @override
  _LargeTextFormFieldState createState() => _LargeTextFormFieldState();
}

class _LargeTextFormFieldState extends State<LargeTextFormField> {
  bool _isFieldEditable;

  @override
  void initState() {
    setState(() => _isFieldEditable = widget.editable);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Stack(
          overflow: Overflow.clip,
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            _textField(context),
            if (widget.loading) _loadingSpinner(),
          ],
        ),
        if (!widget.loading) _editableCheckbox(),
      ],
    );
  }

  Row _editableCheckbox() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Editable:',
          style: TextStyles.editableCheckbox,
          textAlign: TextAlign.right,
        ),
        Checkbox(
          checkColor: ThemeColors.darkBlue,
          materialTapTargetSize: MaterialTapTargetSize.padded,
          value: _isFieldEditable,
          onChanged: _handleCheckboxClick,
        ),
      ],
    );
  }

  Column _loadingSpinner() {
    return Column(children: [
      CircularProgressIndicator(),
      SizedBox(height: 10),
      Text(widget.loadingMessage, style: TextStyles.inputLoadingText),
    ]);
  }

  Container _textField(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(8.0),
        child: TextFormField(
          enabled: !widget.loading && _isFieldEditable,
          scrollPadding: EdgeInsets.zero,
          autocorrect: false,
          minLines: isPortrait(context) ? 10 : 3,
          maxLines: isPortrait(context) ? 10 : 3,
          style: TextStyles.input,
          decoration: InputDecoration(
              filled: true,
              fillColor:
                  ThemeColors.inputFill(widget.loading || !_isFieldEditable),
              border: _inputBorder(ThemeColors.white),
              enabledBorder: _inputBorder(ThemeColors.white, 1),
              errorBorder: _inputBorder(ThemeColors.red, 1),
              focusedBorder: _inputBorder(ThemeColors.white, 1),
              disabledBorder: _inputBorder(ThemeColors.white),
              contentPadding: const EdgeInsets.all(16),
              errorStyle: TextStyle(height: 1)),
          initialValue: widget.initialValue,
          validator: (value) =>
              (value.trim().isEmpty || value.trim() == widget.initialValue) &&
                      (_isFieldEditable == widget.editable)
                  ? widget.error
                  : null,
          onChanged: widget.onChanged,
        ));
  }

  OutlineInputBorder _inputBorder(Color color, [double width = 0]) =>
      OutlineInputBorder(
          borderSide: BorderSide(width: width, color: color),
          borderRadius: BorderRadius.circular(16));

  void _handleCheckboxClick(bool value) {
    setState(() => _isFieldEditable = value);
    widget.onEditableChecked(value);
  }
}
