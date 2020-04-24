import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable(nullable: false)
class Comment {
  final String id;
  final String author;
  final String content;
  final DateTime createdAt;

  Comment(this.id, this.author, this.content, this.createdAt);

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommentToJson(this);

  String dateTime() => DateFormat('hh:mm\nMM.dd').format(createdAt);
}
