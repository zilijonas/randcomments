import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randcomments/api/new_note_request.dart';
import 'package:randcomments/widgets/note_form.dart';

import 'index.dart';

class NewNoteScreen extends StatelessWidget {
  final NewNoteBloc _newNoteBloc;
  final void Function() _navigateBack;

  NewNoteScreen(this._newNoteBloc, this._navigateBack);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewNoteBloc, NewNoteState>(
      listener: (context, state) {
        if (state is NewNoteInitial) {
          _navigateBack();
        }
      },
      builder: (context, state) {
        if (state is NewNoteFailure) {
          return Center(child: Text(state.error));
        }

        return NoteForm(
          title: 'Add Note',
          initialValue: '',
          formFieldError: 'You cannot save an empty note.',
          onEditSaveClicked: (content, editable) =>
              _onSubmitClicked(context, content, editable),
          editSaveLoading: state is NewNoteLoading,
        );
      },
    );
  }

  void _onSubmitClicked(BuildContext context, String content, bool editable) {
    _newNoteBloc.add(SubmitClicked(NewNoteRequest(content, editable)));
  }
}
