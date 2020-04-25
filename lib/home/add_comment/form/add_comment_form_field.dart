import 'package:flutter/material.dart';

class AddCommentFormField extends StatelessWidget {
  final String _label;
  final String _error;
  final void Function(String) _onChanged;

  const AddCommentFormField(this._label, this._error, this._onChanged);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: <Widget>[
          Text(_label),
          TextFormField(
            autocorrect: false,
            validator: (value) {
              if (value.isEmpty) {
                return _error;
              }
              return null;
            },
            onChanged: _onChanged,
          ),
        ],
      ),
    );
  }
}
