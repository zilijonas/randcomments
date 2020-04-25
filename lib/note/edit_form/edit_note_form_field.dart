import 'package:flutter/material.dart';
import 'package:randcomments/widgets/large_text_form_field.dart';

class EditNoteFormField extends StatelessWidget {
  final String _error;
  final void Function(String) _onChanged;
  final String _initialValue;

  EditNoteFormField(this._error, this._onChanged, this._initialValue);

  @override
  Widget build(BuildContext context) {
    return LargeTextFormField(_error, _onChanged, _initialValue);
  }
}
