import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randcomments/api/add-comment-request.dart';
import 'package:randcomments/api/comment/comment.dart';
import 'package:randcomments/home/add_comment/add_comment_modal.dart';

import 'index.dart';

class HomeScreen extends StatefulWidget {
  final HomeBloc _homeBloc;
  HomeScreen(this._homeBloc);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    widget._homeBloc.add(HomeInitiated());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return LinearProgressIndicator();
          }
          if (state is HomeSuccess) {
            return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: state.comments.length,
              itemBuilder: (c, idx) => _buildListItem(state.comments[idx]),
            );
          }
          return SizedBox.shrink();
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

  void _handleCommentAddition(AddCommentRequest comment) async {
    widget._homeBloc.add(AddCommentClicked(comment));
  }

  void _handleCommentRemoval(String id) async {
    widget._homeBloc.add(RemoveCommentClicked(id));
  }

  ListTile _buildListItem(Comment comment) => ListTile(
        title: Text(comment.content ?? ''),
        subtitle: Text(comment.author ?? ''),
        trailing: Text(comment.dateTime() ?? ''),
        onLongPress: () => _handleCommentRemoval(comment.id),
      );
}
