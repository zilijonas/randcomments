import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:randcomments/api/add-comment-request.dart';
import 'package:randcomments/api/comment/comment.dart';
import 'package:randcomments/infrastructure/api-comments.dart';

import 'index.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiComments _apiComments;

  HomeBloc(this._apiComments);

  @override
  HomeState get initialState => HomeInitial();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeInitiated) {
      yield* _fetchComments();
    }

    if (event is AddCommentClicked) {
      yield* _addComment(event.comment);
    }

    if (event is RemoveComment) {
      yield* _removeComment(event.id);
    }
  }

  Stream<HomeState> _fetchComments() async* {
    yield HomeLoading();
    try {
      final result = await _apiComments.comments();
      yield result.fold(
          (comments) => HomeSuccess(comments), (error) => HomeFailure(error));
    } catch (e) {
      yield HomeFailure(e.toString());
    }
  }

  Stream<HomeState> _addComment(AddCommentRequest newComment) async* {
    final currentList = _currentCommentsList(state);
    yield HomeLoading();
    final result = await _apiComments.add(newComment);
    yield result.fold((comment) => HomeSuccess([comment, ...currentList]),
        (error) => HomeFailure(error));
  }

  Stream<HomeState> _removeComment(String id) async* {
    final currentList = _currentCommentsList(state);
    yield HomeLoading();
    yield HomeSuccess(currentList.where((c) => c.id != id).toList());
  }

  List<Comment> _currentCommentsList(HomeState currentState) =>
      currentState is HomeSuccess ? currentState.comments : [];
}
