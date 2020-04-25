import 'package:equatable/equatable.dart';
import 'package:randcomments/api/note/note.dart';

abstract class NoteState extends Equatable {
  @override
  List<Object> get props => [];
}

class NoteInitial extends NoteState {}

class NoteLoading extends NoteState {}

class NoteSuccess extends NoteState {
  final Note note;

  NoteSuccess(this.note);
}

class NoteFailure extends NoteState {
  final String error;

  NoteFailure(this.error);
}
