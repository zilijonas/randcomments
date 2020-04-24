import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:randcomments/api/add-comment-request.dart';
import 'package:randcomments/api/common/order-direction.dart';

@immutable
abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeInitiated extends HomeEvent {
  final OrderDirection direction;

  HomeInitiated(this.direction);
}

class AddCommentClicked extends HomeEvent {
  final AddCommentRequest comment;

  AddCommentClicked(this.comment);
}

class RemoveCommentClicked extends HomeEvent {
  final String id;

  RemoveCommentClicked(this.id);
}

class ReorderClicked extends HomeInitiated {
  ReorderClicked(OrderDirection direction) : super(direction);
}
