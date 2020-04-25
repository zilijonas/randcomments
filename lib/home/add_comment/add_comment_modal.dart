import 'package:flutter/material.dart';
import 'package:randcomments/api/add-comment-request.dart';
import 'package:randcomments/home/add_comment/form/add_comment_form.dart';

class AddCommentModal extends StatelessWidget {
  final void Function(AddCommentRequest) _onSubmit;

  AddCommentModal(this._onSubmit);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Padding(
      padding: const EdgeInsets.all(16),
      child: AddCommentForm(
          (author, content) => _onSubmitClicked(context, author, content)),
    ));
  }

  void _onSubmitClicked(BuildContext context, String author, String content) {
    _onSubmit(AddCommentRequest(author, content, DateTime.now()));
    Navigator.of(context).pop();
  }
}
