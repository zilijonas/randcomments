import 'package:flutter/material.dart';
import 'package:randcomments/widgets/action_button.dart';

import 'edit_note_form_field.dart';

class EditNoteForm extends StatelessWidget {
  final String _id;
  final String _initialValue;
  final void Function(String) _onRemoveClicked;

  EditNoteForm(this._id, this._initialValue, this._onRemoveClicked);

  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {'content': null};

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
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
          EditNoteFormField('You cannot save leave an empty note.',
              (val) => _formData['content'] = val, _initialValue),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ActionButton(
                  Icons.check, Colors.lightGreen, () => Navigator.pop(context)),
              SizedBox(width: 40),
              ActionButton(
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
      ),
    );
  }
}
