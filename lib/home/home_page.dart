import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randcomments/home/add_comment/add_comment_modal.dart';
import 'package:randcomments/home/index.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(BlocProvider.of<HomeBloc>(context)),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 32,
        ),
        onPressed: () {
          showDialog(
              context: context,
              child: AddCommentModal((comment) =>
                  BlocProvider.of<HomeBloc>(context)
                      .add(AddCommentClicked(comment))));
        },
      ),
    );
  }
}
