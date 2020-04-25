import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randcomments/home/list/comments_list.dart';
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
          return CommentsList(state.comments, _navigateToComment);
        }
        return Center(
            child:
                Text(state is HomeFailure ? state.error : 'Data not loaded.'));
      },
    );
  }

  void _navigateToComment(String id) =>
      Navigator.pushNamed(context, commentRoute, arguments: id);
}
