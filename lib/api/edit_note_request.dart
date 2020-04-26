import 'package:built_collection/built_collection.dart';

class EditNoteRequest {
  final String _id;
  final String _content;

  EditNoteRequest(this._id, this._content);

  Map<String, dynamic> toQueryPrams() {
    return BuiltMap<String, String>({
      'id': _id.toString() ?? '',
      'content': _content.toString() ?? '',
      'lastEdited': DateTime.now().toIso8601String() ?? '',
    }).rebuild((x) => x.removeWhere((k, v) => v == '')).toMap();
  }
}
