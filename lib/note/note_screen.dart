import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randcomments/note/index.dart';

import 'edit_form/edit_note_form.dart';

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
      if (state is NoteLoading) {
        return Center(child: CircularProgressIndicator());
      }

      if (state is NoteSuccess) {
        return EditNoteForm(widget._id, state.note.content, _handleNoteRemoval);
      }

      if (state is NoteFailure) {
        return Center(child: Text(state.error));
      }

      return SizedBox.shrink();
    });
  }

  void _handleNoteRemoval(String id) =>
      widget._noteBloc.add(RemoveNoteClicked(id));
}
