import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randcomments/comment/index.dart';

import 'input/comment_input.dart';

class CommentScreen extends StatefulWidget {
  final CommentBloc _commentBloc;
  final String id;

  CommentScreen(this.id, this._commentBloc);

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  TextEditingController _inputController;

  @override
  void initState() {
    _inputController = new TextEditingController();
    widget._commentBloc.add(CommentInitiated(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommentBloc, CommentState>(listener: (context, state) {
      if (state is CommentInitial) {
        Navigator.pop(context);
      }
      if (state is CommentSuccess) {
        setState(() => _inputController.text = state.comment.content);
      }
    }, builder: (context, state) {
      if (state is CommentLoading) {
        return Center(child: CircularProgressIndicator());
      }

      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CommentInput(_inputController),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _actionButton(Icons.check, Colors.green, () {}),
              SizedBox(width: 40),
              _actionButton(Icons.clear, Colors.red,
                  () => _handleCommentRemoval(widget.id)),
            ],
          )
        ],
      );
    });
  }

  IconButton _actionButton(IconData icon, Color color, Function onPressed) {
    return IconButton(
      color: color,
      iconSize: 82,
      icon: Icon(icon),
      onPressed: onPressed,
    );
  }

  void _handleCommentRemoval(String id) =>
      widget._commentBloc.add(RemoveCommentClicked(id));
}
