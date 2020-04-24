import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:randcomments/api/comment/comment.dart';
import 'package:randcomments/home/index.dart';
import 'package:randcomments/infrastructure/api-comments.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiComments _apiComments;

  HomeBloc(this._apiComments);

  @override
  HomeState get initialState => HomeInitial();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    final currentState = state;
    final List<Comment> currentList =
        currentState is HomeSuccess ? currentState.comments : [];

    if (event is HomeInitiated) {
      yield HomeLoading();
      try {
        final comments = await _apiComments.comments();
        yield HomeSuccess(comments);
      } catch (e) {
        yield HomeFailure();
      }
    }

    if (event is AddCommentClicked) {
      yield HomeLoading();
      final comment = await _apiComments.add(event.comment);
      yield HomeSuccess([...currentList, comment]);
    }

    if (event is RemoveCommentClicked) {
      yield HomeLoading();
      try {
        final id = await _apiComments.remove(event.id);
        yield HomeSuccess(currentList.where((c) => c.id != id).toList());
      } catch (e) {
        yield HomeSuccess(currentList);
      }
    }
  }
}
