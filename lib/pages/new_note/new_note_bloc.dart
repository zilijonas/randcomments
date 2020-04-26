import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:randcomments/api/new_note_request.dart';
import 'package:randcomments/core/notes.dart';
import 'package:randcomments/pages/home/index.dart';

import 'index.dart';

class NewNoteBloc extends Bloc<NewNoteEvent, NewNoteState> {
  final Notes _apiNotes;
  final HomeBloc _homeBloc;

  NewNoteBloc(this._apiNotes, this._homeBloc);

  @override
  NewNoteState get initialState => NewNoteInitial();

  @override
  Stream<NewNoteState> mapEventToState(NewNoteEvent event) async* {
    if (event is SubmitClicked) {
      yield* _newNote(event.note);
    }
  }

  Stream<NewNoteState> _newNote(NewNoteRequest newNote) async* {
    yield NewNoteLoading();
    final result = await _apiNotes.add(newNote);
    yield result.fold((note) {
      _homeBloc.add(NewNote(note));
      return NewNoteInitial();
    }, (error) => NewNoteFailure(error));
  }
}
