import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randcomments/comment/index.dart';

import 'edit-form/edit_comment_form.dart';

class CommentScreen extends StatefulWidget {
  final CommentBloc _commentBloc;
  final String _id;

  CommentScreen(this._id, this._commentBloc);

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  TextEditingController _inputController;

  @override
  void initState() {
    _inputController = new TextEditingController();
    widget._commentBloc.add(CommentInitiated(widget._id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommentBloc, CommentState>(listener: (context, state) {
      if (state is CommentInitial) {
        Navigator.pop(context);
      }
      if (state is CommentSuccess) {
        _inputController.text = state.comment.content;
      }
    }, builder: (context, state) {
      if (state is CommentLoading) {
        return Center(child: CircularProgressIndicator());
      }

      return EditCommentForm(
          widget._id, _inputController, _handleCommentRemoval);
    });
  }

  void _handleCommentRemoval(String id) =>
      widget._commentBloc.add(RemoveCommentClicked(id));
}
