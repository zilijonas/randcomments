import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randcomments/pages/home/index.dart';
import 'package:randcomments/router/routes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(BlocProvider.of<HomeBloc>(context),
          (id) => _navigateToNote(context, id)),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 32,
        ),
        onPressed: () => _navigateToNewNote(context),
      ),
    );
  }

  void _navigateToNewNote(BuildContext context) =>
      Navigator.pushNamed(context, newNoteRoute);

  void _navigateToNote(BuildContext context, String id) =>
      Navigator.pushNamed(context, noteRoute, arguments: id);
}
