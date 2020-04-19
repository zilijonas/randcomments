import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable(nullable: false)
class Comment {
  int id;
  final String name;
  final String comment;
  final Timestamp date;

  Comment(this.name, this.comment, this.date, [this.id]);

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommentToJson(this);

  String dateTime() => DateFormat('hh:mm dd.MM.yy').format(date.toDate());

  set setId(int _id) => this.id = _id;
}
