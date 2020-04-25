import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:randcomments/api/note/note.dart';

@immutable
abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeInitiated extends HomeEvent {}

class AddNote extends HomeEvent {
  final Note note;

  AddNote(this.note);
}

class RemoveNote extends HomeEvent {
  final String id;

  RemoveNote(this.id);
}
