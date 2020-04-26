import 'package:dartz/dartz.dart';
import 'package:randcomments/api/new_note_request.dart';
import 'package:randcomments/api/edit_note_request.dart';
import 'package:randcomments/api/note/note.dart';

abstract class Notes {
  Future<Either<List<Note>, String>> notes();

  Future<Either<Note, String>> note(String id);

  Future<Either<Note, String>> add(NewNoteRequest note);

  Future<Either<Note, String>> edit(EditNoteRequest note);

  Future<Either<String, String>> remove(String id);
}
