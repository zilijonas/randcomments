import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randcomments/theme/colors.dart';
import 'package:randcomments/widgets/form_route_container.dart';

import 'index.dart';

class NotePage extends StatelessWidget {
  final String _id;

  NotePage(this._id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.blue,
      body: FormRouteContainer(
          child: NoteScreen(_id, BlocProvider.of<NoteBloc>(context))),
    );
  }
}
