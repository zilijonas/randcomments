import 'package:equatable/equatable.dart';
import 'package:randcomments/api/comment/comment.dart';

abstract class CommentState extends Equatable {
  @override
  List<Object> get props => [];
}

class CommentInitial extends CommentState {}

class CommentLoading extends CommentState {}

class CommentSuccess extends CommentState {
  final Comment comment;

  CommentSuccess(this.comment);
}

class CommentFailure extends CommentState {
  final String error;

  CommentFailure(this.error);
}
