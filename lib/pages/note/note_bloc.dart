import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:randcomments/api/edit_note_request.dart';
import 'package:randcomments/core/notes.dart';
import 'package:randcomments/pages/home/index.dart';

import 'index.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final Notes _apiNotes;
  final HomeBloc _homeBloc;

  NoteBloc(this._apiNotes, this._homeBloc);

  @override
  NoteState get initialState => NoteInitial();

  @override
  Stream<NoteState> mapEventToState(NoteEvent event) async* {
    if (event is NoteInitiated) {
      yield* _fetchNote(event.id);
    }

    if (event is EditSaveClicked) {
      yield* _editNote(event.note);
    }

    if (event is RemoveNoteClicked) {
      yield* _removeNote(event.id);
    }
  }

  Stream<NoteState> _fetchNote(String id) async* {
    yield NoteLoading();
    try {
      final result = await _apiNotes.note(id);
      yield result.fold(
          (note) => NoteSuccess(note), (error) => NoteFailure(error));
    } catch (e) {
      yield NoteFailure(e.toString());
    }
  }

  Stream<NoteState> _editNote(EditNoteRequest note) async* {
    yield NoteEditLoading();
    try {
      final result = await _apiNotes.edit(note);
      yield result.fold((editedNote) {
        _homeBloc.add(EditNote(editedNote));
        return NoteInitial();
      }, (error) => NoteFailure(error));
    } catch (e) {
      yield NoteFailure(e.toString());
    }
  }

  Stream<NoteState> _removeNote(String id) async* {
    yield NoteRemoveLoading();
    try {
      final result = await _apiNotes.remove(id);
      yield result.fold((id) {
        _homeBloc.add(RemoveNote(id));
        return NoteInitial();
      }, (error) => NoteFailure(error));
    } catch (e) {
      yield NoteFailure(e);
    }
  }
}
