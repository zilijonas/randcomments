import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:randcomments/api/add_note_request.dart';
import 'package:randcomments/pages/home/index.dart';
import 'package:randcomments/infrastructure/api_notes.dart';

import 'index.dart';

class AddNoteBloc extends Bloc<AddNoteEvent, AddNoteState> {
  final ApiNotes _apiNotes;
  final HomeBloc _homeBloc;

  AddNoteBloc(this._apiNotes, this._homeBloc);

  @override
  AddNoteState get initialState => AddNoteInitial();

  @override
  Stream<AddNoteState> mapEventToState(AddNoteEvent event) async* {
    if (event is SubmitClicked) {
      yield* _addNote(event.note);
    }
  }

  Stream<AddNoteState> _addNote(AddNoteRequest newNote) async* {
    yield AddNoteLoading();
    final result = await _apiNotes.add(newNote);
    yield result.fold((note) {
      _homeBloc.add(AddNote(note));
      return AddNoteInitial();
    }, (error) => AddNoteFailure(error));
  }
}
