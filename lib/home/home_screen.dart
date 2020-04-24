import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randcomments/api/add-comment-request.dart';
import 'package:randcomments/api/comment/comment.dart';
import 'package:randcomments/api/common/order-direction.dart';
import 'package:randcomments/home/add_comment/add_comment_modal.dart';

import 'index.dart';

class HomeScreen extends StatefulWidget {
  final HomeBloc _homeBloc;
  HomeScreen(this._homeBloc);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  OrderDirection direction = OrderDirection.desc;

  @override
  void initState() {
    widget._homeBloc.add(HomeInitiated(direction));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
        actions: [_orderDirectionButton(direction == OrderDirection.asc)],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading || state is HomeInitial) {
            return LinearProgressIndicator();
          }
          if (state is HomeSuccess) {
            return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: state.comments.length,
              itemBuilder: (c, idx) => _buildListItem(state.comments[idx]),
            );
          }
          return Center(
              child: Text(
                  state is HomeFailure ? state.error : 'Data not loaded.'));
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

  FlatButton _orderDirectionButton(bool directionIsAscending) {
    return FlatButton.icon(
      label: Text(
        'Order',
        style: TextStyle(color: Colors.white),
      ),
      icon: Icon(
        directionIsAscending ? Icons.arrow_downward : Icons.arrow_upward,
        color: Colors.white,
      ),
      onPressed: _handleReorderClick,
    );
  }

  void _handleCommentAddition(AddCommentRequest comment) async {
    widget._homeBloc.add(AddCommentClicked(comment));
  }

  void _handleCommentRemoval(String id) async {
    widget._homeBloc.add(RemoveCommentClicked(id));
  }

  void _handleReorderClick() async {
    final newDirection = direction.switchDirection();
    setState(() => direction = newDirection);
    widget._homeBloc.add(ReorderClicked(newDirection));
  }

  ListTile _buildListItem(Comment comment) => ListTile(
        title: Text(comment.content ?? ''),
        subtitle: Text(comment.author ?? ''),
        trailing: Text(
          comment.dateTime() ?? '',
          textAlign: TextAlign.right,
        ),
        onLongPress: () => _handleCommentRemoval(comment.id),
      );
}
