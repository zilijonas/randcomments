import 'package:flutter/material.dart';
import 'package:randcomments/widgets/action_button.dart';

import 'add_note_form_field.dart';

class AddNoteForm extends StatelessWidget {
  final bool _loading;
  final void Function(String) _onSubmitClicked;

  AddNoteForm(this._loading, this._onSubmitClicked);

  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {'content': null};

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 36),
                child: Text(
                  'Add Note',
                  style: TextStyle(color: Colors.white, fontSize: 36),
                ),
              ),
              AddNoteFormField(
                'You cannot save leave an empty note.',
                (val) => _formData['content'] = val,
              ),
              ActionButton(
                  Icons.check, Colors.lightGreen, _handleSubmit, _loading),
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
            ]));
  }

  void _handleSubmit() {
    if (_formKey.currentState.validate()) {
      _onSubmitClicked(_formData['content']);
    }
  }
}
