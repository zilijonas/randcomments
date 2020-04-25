import 'package:built_collection/built_collection.dart';

class AddNoteRequest {
  final String _content;
  final DateTime _lastEdited;

  AddNoteRequest(this._content, this._lastEdited);

  Map<String, dynamic> toQueryPrams() {
    return BuiltMap<String, String>({
      'content': _content.toString() ?? '',
      'lastEdited': _lastEdited.toIso8601String() ?? '',
    }).rebuild((x) => x.removeWhere((k, v) => v == '')).toMap();
  }
}
