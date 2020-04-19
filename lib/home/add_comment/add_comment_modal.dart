import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:randcomments/api/models/comment/comment.dart';

import 'form/comment_form_field.dart';

class AddCommentModal extends StatelessWidget {
  final void Function(Comment) _onSubmit;

  AddCommentModal(this._onSubmit);

  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {'name': null, 'comment': null};

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            CommentFormField('Name', 'Please enter the name',
                (val) => _formData['name'] = val),
            CommentFormField('Comment', 'Please enter the comment',
                (val) => _formData['comment'] = val),
            RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _onSubmit(Comment(
                    _formData['name'],
                    _formData['comment'],
                    Timestamp.now(),
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
