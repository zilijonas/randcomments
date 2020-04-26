import 'package:dio/dio.dart';

import 'new_note_request.dart';
import 'edit_note_request.dart';
import 'note/note.dart';

class Api {
  final Dio _dio;
  Api(this._dio);

  Future<Note> newNote(NewNoteRequest note) async {
    final response =
        await _dio.post('addNote', queryParameters: note.toQueryPrams());
    print(note.toQueryPrams());
    print(response.data);
    return Note.fromJson(response.data);
  }

  Future<Note> editNote(EditNoteRequest note) async {
    final response =
        await _dio.post('editNote', queryParameters: note.toQueryPrams());
    print(note.toQueryPrams());
    print(response.data);
    return Note.fromJson(response.data);
  }

  Future<String> removeNote(String id) async {
    final response = await _dio.post('removeNote', queryParameters: {"id": id});
    return response.data["id"];
  }

  Future<List<Note>> notes() async {
    final response = await _dio.get('getNotes');
    return response.data["notes"].map<Note>((c) => Note.fromJson(c)).toList();
  }

  Future<Note> note(String id) async {
    final response = await _dio.post('getNote', queryParameters: {"id": id});
    return Note.fromJson(response.data);
  }
}
