import 'package:flutter/material.dart';

class LargeTextFormField extends StatelessWidget {
  final String _error;
  final void Function(String) _onChanged;
  final String _initialValue;

  LargeTextFormField(this._error, this._onChanged, this._initialValue);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(32),
        ),
        child: TextFormField(
          scrollPadding: EdgeInsets.zero,
          autocorrect: false,
          minLines: 10,
          maxLines: 10,
          style: TextStyle(fontSize: 24),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16)),
          initialValue: _initialValue,
          validator: (value) =>
              (value.trim().isEmpty || value.trim() == _initialValue)
                  ? _error
                  : null,
          onChanged: _onChanged,
        ));
  }
}
