import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randcomments/add_note/index.dart';
import 'package:randcomments/widgets/child_route_container.dart';

class AddNotePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[300],
      body: ChildRouteContainer(
        child: AddNoteScreen(BlocProvider.of<AddNoteBloc>(context),
            () => _navigateBack(context)),
      ),
    );
  }

  void _navigateBack(BuildContext context) => Navigator.pop(context);
}
