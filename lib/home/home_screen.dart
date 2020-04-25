import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randcomments/api/comment/comment.dart';
import 'package:randcomments/router/routes.dart';

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
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading || state is HomeInitial) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is HomeSuccess) {
          return ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: state.comments.length,
            itemBuilder: (c, idx) => _buildListItem(state.comments[idx]),
          );
        }
        return Center(
            child:
                Text(state is HomeFailure ? state.error : 'Data not loaded.'));
      },
    );
  }

  ListTile _buildListItem(Comment comment) => ListTile(
        title: Text(comment.content ?? ''),
        subtitle: Text(comment.author ?? ''),
        trailing: Text(
          comment.dateTime() ?? '',
          textAlign: TextAlign.right,
        ),
        onTap: () =>
            Navigator.pushNamed(context, commentRoute, arguments: comment.id),
      );
}
