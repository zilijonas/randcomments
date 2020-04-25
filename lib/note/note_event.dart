import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class NoteEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NoteInitiated extends NoteEvent {
  final String id;

  NoteInitiated(this.id);
}

class RemoveNoteClicked extends NoteEvent {
  final String id;

  RemoveNoteClicked(this.id);
}
