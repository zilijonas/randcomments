import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:randcomments/api/add_note_request.dart';

@immutable
abstract class AddNoteEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SubmitClicked extends AddNoteEvent {
  final AddNoteRequest note;

  SubmitClicked(this.note);
}
