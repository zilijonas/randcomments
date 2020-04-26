import 'package:built_collection/built_collection.dart';

class EditNoteRequest {
  final String _id;
  final String _content;
  final bool _editable;

  EditNoteRequest(this._id, this._content, this._editable);

  Map<String, dynamic> toQueryPrams() {
    return BuiltMap<String, String>({
      'id': _id.toString() ?? '',
      'content': _content.toString() ?? '',
      'editable': _editable.toString() ?? '',
      'lastEdited': DateTime.now().toIso8601String() ?? '',
    }).rebuild((x) => x.removeWhere((k, v) => v == '')).toMap();
  }
}
