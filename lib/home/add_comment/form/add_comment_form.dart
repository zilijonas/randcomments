import 'package:flutter/material.dart';

import 'add_comment_form_field.dart';

class AddCommentForm extends StatelessWidget {
  final void Function(String, String) _onSubmitClicked;

  AddCommentForm(this._onSubmitClicked);

  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {'author': null, 'content': null};

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          AddCommentFormField('Name', 'Please enter the name',
              (val) => _formData['author'] = val),
          AddCommentFormField('Comment', 'Please enter the comment',
              (val) => _formData['content'] = val),
          RaisedButton(
            onPressed: _handleSubmit,
            child: Text('Submit'),
          )
        ]));
  }

  void _handleSubmit() {
    if (_formKey.currentState.validate()) {
      _onSubmitClicked(_formData['author'], _formData['content']);
    }
  }
}
