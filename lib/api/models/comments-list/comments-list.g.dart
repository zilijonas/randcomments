// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments-list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentsList _$CommentsListFromJson(Map<String, dynamic> json) {
  return CommentsList(
    (json['comments'] as List)
        .map((e) => Comment.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CommentsListToJson(CommentsList instance) =>
    <String, dynamic>{
      'comments': instance.list.map((e) => e.toJson()).toList(),
    };
