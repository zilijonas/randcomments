import 'package:flutter/material.dart';

class CommentInput extends StatelessWidget {
  final TextEditingController _inputController;

  CommentInput(this._inputController);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(32),
      ),
      child: TextFormField(
        minLines: 10,
        maxLines: 10,
        style: TextStyle(fontSize: 24),
        decoration: InputDecoration(
            border: InputBorder.none, contentPadding: const EdgeInsets.all(16)),
        controller: _inputController,
      ),
    );
  }
}
