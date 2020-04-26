import 'package:built_collection/built_collection.dart';

class NewNoteRequest {
  final String _content;

  NewNoteRequest(this._content);

  Map<String, dynamic> toQueryPrams() {
    return BuiltMap<String, String>({
      'content': _content.toString() ?? '',
      'lastEdited': DateTime.now().toIso8601String() ?? '',
    }).rebuild((x) => x.removeWhere((k, v) => v == '')).toMap();
  }
}
