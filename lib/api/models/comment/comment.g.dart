// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment(
    json['name'] as String,
    json['comment'] as String,
    json['date'] as Timestamp,
    json['id'] as int,
  );
}

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'name': instance.name,
      'comment': instance.comment,
      'date': instance.date,
      'id': instance.id,
    };
