import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randcomments/api/edit_note_request.dart';
import 'package:randcomments/widgets/note_form.dart';

import 'index.dart';

class NoteScreen extends StatefulWidget {
  final NoteBloc _noteBloc;
  final String _id;

  NoteScreen(this._id, this._noteBloc);

  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  void initState() {
    widget._noteBloc.add(NoteInitiated(widget._id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteBloc, NoteState>(listener: (context, state) {
      if (state is NoteInitial) {
        Navigator.pop(context);
      }
    }, builder: (context, state) {
      if (state is NoteFailure) {
        return Center(child: Text(state.error));
      }

      return NoteForm(
        title: 'Edit Note',
        initialValue: state is NoteSuccess ? state.note.content : '',
        isInitialyEditable: state is NoteSuccess ? state.note.editable : false,
        formFieldError: 'You cannot save an empty or unedited note.',
        onEditSaveClicked: _handleNoteEdition,
        onRemoveClicked: _handleNoteRemoval,
        editSaveLoading: state is NoteEditLoading,
        removeLoading: state is NoteRemoveLoading,
      );
    });
  }

  void _handleNoteRemoval() =>
      widget._noteBloc.add(RemoveNoteClicked(widget._id));

  void _handleNoteEdition(String content, bool editable) => widget._noteBloc
      .add(EditSaveClicked(EditNoteRequest(widget._id, content, editable)));
}
