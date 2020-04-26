import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' show DioError;
import 'package:randcomments/api/new_note_request.dart';
import 'package:randcomments/api/edit_note_request.dart';
import 'package:randcomments/api/api.dart';
import 'package:randcomments/api/note/note.dart';
import 'package:randcomments/core/notes.dart';

class ApiNotes extends Notes {
  final Api _api;
  ApiNotes(this._api);

  Future<Either<List<Note>, String>> notes() async {
    try {
      return Left(await _api.notes());
    } on DioError catch (error) {
      return Right(error.message);
    }
  }

  Future<Either<Note, String>> note(String id) async {
    try {
      return Left(await _api.note(id));
    } on DioError catch (error) {
      return Right(error.message);
    }
  }

  Future<Either<Note, String>> add(NewNoteRequest note) async {
    try {
      return Left(await _api.newNote(note));
    } on DioError catch (error) {
      return Right(error.message);
    }
  }

  Future<Either<Note, String>> edit(EditNoteRequest note) async {
    try {
      return Left(await _api.editNote(note));
    } on DioError catch (error) {
      return Right(error.message);
    }
  }

  Future<Either<String, String>> remove(String id) async {
    try {
      return Left(await _api.removeNote(id));
    } on DioError catch (error) {
      return Right(error.message);
    }
  }
}
