import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randcomments/note/index.dart';
import 'package:randcomments/widgets/child_route_container.dart';

class NotePage extends StatelessWidget {
  final String _id;

  NotePage(this._id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[300],
      body: ChildRouteContainer(
          child: NoteScreen(_id, BlocProvider.of<NoteBloc>(context))),
    );
  }
}
