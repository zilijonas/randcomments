import 'package:flutter/material.dart';
import 'package:randcomments/api/note/note.dart';

import 'notes_list_item.dart';

class NotesList extends StatelessWidget {
  final List<Note> _notes;
  final void Function(String) _onItemClicked;

  NotesList(this._notes, this._onItemClicked);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: _notes.length,
      itemBuilder: (c, idx) =>
          NotesListItem(_notes[idx], () => _onItemClicked(_notes[idx].id)),
    );
  }
}
