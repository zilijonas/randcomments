import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CommentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CommentInitiated extends CommentEvent {
  final String id;

  CommentInitiated(this.id);
}

class RemoveCommentClicked extends CommentEvent {
  final String id;

  RemoveCommentClicked(this.id);
}
