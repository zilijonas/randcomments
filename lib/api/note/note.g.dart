// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Note _$NoteFromJson(Map<String, dynamic> json) {
  return Note(
    json['id'] as String,
    json['content'] as String,
    DateTime.parse(json['lastEdited'] as String),
  );
}

Map<String, dynamic> _$NoteToJson(Note instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'lastEdited': instance.lastEdited.toIso8601String(),
    };
