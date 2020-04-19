import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:randcomments/api/models/comment/comment.dart';
import 'package:randcomments/api/models/comments-list/comments-list.dart';
import 'package:randcomments/home/add_comment/add_comment_modal.dart';

import 'index.dart';

class HomeScreen extends StatelessWidget {
  final HomeBloc _homeBloc;
  HomeScreen(this._homeBloc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: _homeBloc.outFirestore,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();
          final comments = CommentsList.fromJson(snapshot.data.data).list;
          return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: comments.length,
              itemBuilder: (context, idx) {
                return _buildListItem(comments[idx]);
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('Add+'),
        onPressed: () {
          showDialog(
              context: context, child: AddCommentModal(_handleCommentAddition));
        },
      ),
    );
  }

  void _handleCommentAddition(Comment comment) async {
    _homeBloc.add(AddCommentClicked(comment));
  }

  void _handleCommentRemoval(int id) async {
    _homeBloc.add(RemoveCommentClicked(id));
  }

  ListTile _buildListItem(Comment comment) => ListTile(
        title: Text(comment.comment),
        subtitle: Text(comment.name),
        trailing: Text(comment.dateTime()),
        onLongPress: () => _handleCommentRemoval(comment.id),
      );
}
