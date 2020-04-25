import 'package:flutter/material.dart';
import 'package:randcomments/api/comment/comment.dart';
import 'package:randcomments/home/list/comments_list_item.dart';

class CommentsList extends StatelessWidget {
  final List<Comment> _comments;
  final void Function(String) _onItemClicked;

  CommentsList(this._comments, this._onItemClicked);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: _comments.length,
      itemBuilder: (c, idx) => CommentsListItem(
          _comments[idx], () => _onItemClicked(_comments[idx].id)),
    );
  }
}
