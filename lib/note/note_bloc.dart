import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:randcomments/home/index.dart';
import 'package:randcomments/infrastructure/api_notes.dart';

import 'index.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final ApiNotes _apiNotes;
  final HomeBloc _homeBloc;

  NoteBloc(this._apiNotes, this._homeBloc);

  @override
  NoteState get initialState => NoteInitial();

  @override
  Stream<NoteState> mapEventToState(NoteEvent event) async* {
    if (event is NoteInitiated) {
      yield* _fetchNote(event.id);
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

  Stream<NoteState> _removeNote(String id) async* {
    yield NoteLoading();
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
