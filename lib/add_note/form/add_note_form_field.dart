import 'package:flutter/material.dart';
import 'package:randcomments/widgets/large_text_form_field.dart';

class AddNoteFormField extends StatelessWidget {
  final String _error;
  final void Function(String) _onChanged;

  const AddNoteFormField(this._error, this._onChanged);

  @override
  Widget build(BuildContext context) {
    return LargeTextFormField(_error, _onChanged);
  }
}
