import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randcomments/theme/colors.dart';
import 'package:randcomments/widgets/form_route_container.dart';

import 'index.dart';

class AddNotePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.blue,
      body: FormRouteContainer(
        child: AddNoteScreen(BlocProvider.of<AddNoteBloc>(context),
            () => _navigateBack(context)),
      ),
    );
  }

  void _navigateBack(BuildContext context) => Navigator.pop(context);
}
