import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:randcomments/api/new_note_request.dart';

@immutable
abstract class NewNoteEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SubmitClicked extends NewNoteEvent {
  final NewNoteRequest note;

  SubmitClicked(this.note);
}
