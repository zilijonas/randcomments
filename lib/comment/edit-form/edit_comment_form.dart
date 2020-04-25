import 'package:flutter/material.dart';

import 'input/edit_comment_form_input.dart';

class EditCommentForm extends StatelessWidget {
  final String _id;
  final TextEditingController _inputController;
  final void Function(String) _onRemoveClicked;

  EditCommentForm(this._id, this._inputController, this._onRemoveClicked);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 36),
          child: Text(
            'Edit Note',
            style: TextStyle(color: Colors.white, fontSize: 36),
          ),
        ),
        EditCommentFormInput(_inputController),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _actionButton(
                Icons.check, Colors.lightGreen, () => Navigator.pop(context)),
            SizedBox(width: 40),
            _actionButton(
                Icons.clear, Colors.red[400], () => _onRemoveClicked(_id)),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.keyboard_arrow_left, color: Colors.white),
            Text(
              'Swipe right to return',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ],
    );
  }

  Widget _actionButton(IconData icon, Color color, Function onPressed) {
    return ButtonTheme(
        minWidth: 72.0,
        height: 72.0,
        child: RaisedButton(
          color: color,
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(36)),
          child: Icon(
            icon,
            color: Colors.white,
            size: 36,
          ),
          onPressed: onPressed,
        ));
  }
}
