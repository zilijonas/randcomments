import 'package:json_annotation/json_annotation.dart';
import 'package:randcomments/api/models/comment/comment.dart';

part 'comments-list.g.dart';

@JsonSerializable(nullable: false, explicitToJson: true)
class CommentsList {
  @JsonKey(name: 'comments')
  final List<Comment> list;

  const CommentsList(this.list);

  factory CommentsList.fromJson(Map<String, dynamic> json) =>
      _$CommentsListFromJson(json);
  Map<String, dynamic> toJson() => _$CommentsListToJson(this);
}
