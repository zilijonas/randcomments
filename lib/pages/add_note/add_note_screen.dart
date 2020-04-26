import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randcomments/api/add_note_request.dart';
import 'package:randcomments/widgets/note_form_view.dart';

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

        return NoteFormView(
          title: 'Add Note',
          initialValue: '',
          formFieldError: 'You cannot save an empty note.',
          onEditSaveClicked: (content) => _onSubmitClicked(context, content),
          editSaveLoading: state is AddNoteLoading,
        );
      },
    );
  }

  void _onSubmitClicked(BuildContext context, String content) {
    _addNoteBloc.add(SubmitClicked(AddNoteRequest(content)));
  }
}
