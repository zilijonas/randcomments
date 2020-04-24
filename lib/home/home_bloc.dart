import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:randcomments/api/add-comment-request.dart';
import 'package:randcomments/api/comment/comment.dart';
import 'package:randcomments/api/common/order-by-child.dart';
import 'package:randcomments/api/common/order-direction.dart';
import 'package:randcomments/home/index.dart';
import 'package:randcomments/infrastructure/api-comments.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiComments _apiComments;

  HomeBloc(this._apiComments);

  @override
  HomeState get initialState => HomeInitial();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeInitiated) {
      yield* _fetchComments(event.direction);
    }

    if (event is AddCommentClicked) {
      yield* _addComment(event.comment);
    }

    if (event is RemoveCommentClicked) {
      yield* _removeComment(event.id);
    }
  }

  Stream<HomeState> _fetchComments(OrderDirection direction) async* {
    yield HomeLoading();
    try {
      final result =
          await _apiComments.comments(OrderByChild.createdAt, direction);
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
    yield result.fold((comment) => HomeSuccess([...currentList, comment]),
        (error) => HomeFailure(error));
  }

  Stream<HomeState> _removeComment(String id) async* {
    final currentList = _currentCommentsList(state);
    yield HomeLoading();
    try {
      final result = await _apiComments.remove(id);
      yield result.fold(
          (id) => HomeSuccess(currentList.where((c) => c.id != id).toList()),
          (error) => HomeFailure(error));
    } catch (e) {
      yield HomeSuccess(currentList);
    }
  }

  List<Comment> _currentCommentsList(HomeState currentState) =>
      currentState is HomeSuccess ? currentState.comments : [];
}
