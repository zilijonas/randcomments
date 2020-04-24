// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment(
    json['id'] as String,
    json['author'] as String,
    json['content'] as String,
    DateTime.parse(json['createdAt'] as String),
  );
}

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
    };
