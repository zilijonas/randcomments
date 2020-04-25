import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randcomments/comment/index.dart';
import 'package:randcomments/widgets/child_route_container.dart';

class CommentPage extends StatelessWidget {
  final String _id;

  CommentPage(this._id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[300],
      body: ChildRouteContainer(
          child: CommentScreen(_id, BlocProvider.of<CommentBloc>(context))),
    );
  }
}
