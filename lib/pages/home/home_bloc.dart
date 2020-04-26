import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:randcomments/api/edit_note_request.dart';
import 'package:randcomments/api/note/note.dart';
import 'package:randcomments/infrastructure/api_notes.dart';

import 'index.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiNotes _apiNotes;

  HomeBloc(this._apiNotes);

  @override
  HomeState get initialState => HomeInitial();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeInitiated) {
      yield* _fetchNotes();
    }

    if (event is AddNote) {
      yield* _addNote(event.note);
    }

    if (event is EditNote) {
      yield* _editNote(event.note);
    }

    if (event is RemoveNote) {
      yield* _removeNote(event.id);
    }
  }

  Stream<HomeState> _fetchNotes() async* {
    yield HomeLoading();
    try {
      final result = await _apiNotes.notes();
      yield result.fold(
          (notes) => HomeSuccess(notes), (error) => HomeFailure(error));
    } catch (e) {
      yield HomeFailure(e.toString());
    }
  }

  Stream<HomeState> _addNote(Note note) async* {
    final currentList = _currentNotesList(state);
    yield HomeLoading();
    yield HomeSuccess([note, ...currentList]);
  }

  Stream<HomeState> _editNote(Note note) async* {
    final currentList = _currentNotesList(state);
    yield HomeLoading();
    yield HomeSuccess(
        [note, ...currentList.where((n) => n.id != note.id).toList()]);
  }

  Stream<HomeState> _removeNote(String id) async* {
    final currentList = _currentNotesList(state);
    yield HomeLoading();
    yield HomeSuccess(currentList.where((n) => n.id != id).toList());
  }

  List<Note> _currentNotesList(HomeState currentState) =>
      currentState is HomeSuccess ? [...currentState.notes] : [];
}
