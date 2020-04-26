import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randcomments/pages/home/widgets/list/notes_list.dart';

import 'index.dart';

class HomeScreen extends StatefulWidget {
  final HomeBloc _homeBloc;
  final void Function(String) _navigateToNote;

  HomeScreen(this._homeBloc, this._navigateToNote);

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
          return NotesList(state.notes, widget._navigateToNote);
        }
        return Center(
            child:
                Text(state is HomeFailure ? state.error : 'Data not loaded.'));
      },
    );
  }
}
