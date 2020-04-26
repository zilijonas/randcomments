import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randcomments/api/new_note_request.dart';
import 'package:randcomments/widgets/note_form_view.dart';

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

        return NoteFormView(
          title: 'Add Note',
          initialValue: '',
          formFieldError: 'You cannot save an empty note.',
          onEditSaveClicked: (content) => _onSubmitClicked(context, content),
          editSaveLoading: state is NewNoteLoading,
        );
      },
    );
  }

  void _onSubmitClicked(BuildContext context, String content) {
    _newNoteBloc.add(SubmitClicked(NewNoteRequest(content)));
  }
}
