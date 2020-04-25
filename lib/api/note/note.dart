import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'note.g.dart';

@JsonSerializable(nullable: false)
class Note {
  final String id;
  final String content;
  final DateTime lastEdited;

  Note(this.id, this.content, this.lastEdited);

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
  Map<String, dynamic> toJson() => _$NoteToJson(this);

  String time() => DateFormat('hh:mm').format(lastEdited);
  String date() => DateFormat('yyyy.MM.dd').format(lastEdited);

  String dateAndTime() => DateFormat('yyyy.MM.dd hh:mm').format(lastEdited);
}
