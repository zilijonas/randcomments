import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:randcomments/api/models/comment/comment.dart';

@immutable
abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeInitiated extends HomeEvent {}

class AddCommentClicked extends HomeEvent {
  final Comment comment;

  AddCommentClicked(this.comment);
}

class RemoveCommentClicked extends HomeEvent {
  final int id;

  RemoveCommentClicked(this.id);
}
