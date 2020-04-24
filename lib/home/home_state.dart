import 'package:equatable/equatable.dart';
import 'package:randcomments/api/comment/comment.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<Comment> comments;

  HomeSuccess(this.comments);
}

class HomeFailure extends HomeState {
  final String error;

  HomeFailure(this.error);
}
