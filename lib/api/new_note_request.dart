import 'package:built_collection/built_collection.dart';

class NewNoteRequest {
  final String _content;
  final bool _editable;

  NewNoteRequest(this._content, this._editable);

  Map<String, dynamic> toQueryPrams() {
    return BuiltMap<String, String>({
      'content': _content.toString() ?? '',
      'editable': _editable.toString() ?? '',
      'lastEdited': DateTime.now().toIso8601String() ?? '',
    }).rebuild((x) => x.removeWhere((k, v) => v == '')).toMap();
  }
}
