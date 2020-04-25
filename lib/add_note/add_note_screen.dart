import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randcomments/api/add_note_request.dart';

import 'form/add_note_form.dart';
import 'index.dart';

class AddNoteScreen extends StatelessWidget {
  final AddNoteBloc _addNoteBloc;
  final void Function() _navigateBack;

  AddNoteScreen(this._addNoteBloc, this._navigateBack);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteBloc, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteInitial) {
          _navigateBack();
        }
      },
      builder: (context, state) {
        if (state is AddNoteFailure) {
          return Center(child: Text(state.error));
        }

        return AddNoteForm(state is AddNoteLoading,
            (content) => _onSubmitClicked(context, content));
      },
    );
  }

  void _onSubmitClicked(BuildContext context, String content) {
    _addNoteBloc.add(SubmitClicked(AddNoteRequest(content, DateTime.now())));
  }
}
