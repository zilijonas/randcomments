import 'package:flutter/material.dart';
import 'package:randcomments/api/add-comment-request.dart';

import 'form/comment_form_field.dart';

class AddCommentModal extends StatelessWidget {
  final void Function(AddCommentRequest) _onSubmit;

  AddCommentModal(this._onSubmit);

  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {'author': null, 'content': null};

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            CommentFormField('Name', 'Please enter the name',
                (val) => _formData['author'] = val),
            CommentFormField('Comment', 'Please enter the comment',
                (val) => _formData['content'] = val),
            RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _onSubmit(AddCommentRequest(
                    _formData['author'],
                    _formData['content'],
                    DateTime.now(),
                  ));
                  Navigator.of(context).pop();
                }
              },
              child: Text('Submit'),
            )
          ])),
    ));
  }
}
