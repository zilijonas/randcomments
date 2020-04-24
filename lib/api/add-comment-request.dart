import 'package:built_collection/built_collection.dart';

class AddCommentRequest {
  final String _author;
  final String _content;
  final DateTime _createdAt;

  AddCommentRequest(this._author, this._content, this._createdAt);

  Map<String, dynamic> toQueryPrams() {
    return BuiltMap<String, String>({
      'author': _author.toString() ?? '',
      'content': _content.toString() ?? '',
      'createdAt': _createdAt.toIso8601String() ?? '',
    }).rebuild((x) => x.removeWhere((k, v) => v == '')).toMap();
  }
}
