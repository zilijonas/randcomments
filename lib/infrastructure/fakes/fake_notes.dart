import 'package:dartz/dartz.dart';
import 'package:randcomments/api/add_note_request.dart';
import 'package:randcomments/api/edit_note_request.dart';
import 'package:randcomments/api/note/note.dart';
import 'package:randcomments/core/notes.dart';

class FakeNotes extends Notes {
  final Note fakeNote;
  final String error;

  FakeNotes(this.fakeNote, [this.error]);

  @override
  Future<Either<Note, String>> add(AddNoteRequest note) =>
      Future.value(error == null ? Left(fakeNote) : Right(error));

  @override
  Future<Either<Note, String>> edit(EditNoteRequest note) =>
      Future.value(error == null ? Left(fakeNote) : Right(error));

  @override
  Future<Either<Note, String>> note(String id) =>
      Future.value(error == null ? Left(fakeNote) : Right(error));

  @override
  Future<Either<List<Note>, String>> notes() =>
      Future.value(error == null ? Left([fakeNote]) : Right(error));

  @override
  Future<Either<String, String>> remove(String id) =>
      Future.value(error == null ? Left(id) : Right(error));
}
