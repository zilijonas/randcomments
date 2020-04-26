import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:built_collection/built_collection.dart';

part 'note.g.dart';

@JsonSerializable(nullable: false)
class Note {
  final String id;
  final String content;
  final bool editable;
  final DateTime lastEdited;

  Note(this.id, this.content, this.editable, this.lastEdited);

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
  Map<String, dynamic> toJson() => _$NoteToJson(this);

  String time() => DateFormat('hh:mm').format(lastEdited);
  String date() => DateFormat('yyyy.MM.dd').format(lastEdited);

  String dateAndTime() => DateFormat('yyyy.MM.dd hh:mm').format(lastEdited);

  Map<String, dynamic> toQueryPrams() {
    return BuiltMap<String, String>({
      'id': id.toString(),
      'content': content.toString() ?? '',
      'lastEdited': lastEdited.toIso8601String() ?? '',
    }).rebuild((x) => x.removeWhere((k, v) => v == '')).toMap();
  }
}
