import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:randcomments/home/index.dart';
import 'package:randcomments/infrastructure/api-comments.dart';

import 'index.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final ApiComments _apiComments;
  final HomeBloc _homeBloc;

  CommentBloc(this._apiComments, this._homeBloc);

  @override
  CommentState get initialState => CommentInitial();

  @override
  Stream<CommentState> mapEventToState(CommentEvent event) async* {
    if (event is CommentInitiated) {
      yield* _fetchComment(event.id);
    }

    if (event is RemoveCommentClicked) {
      yield* _removeComment(event.id);
    }
  }

  Stream<CommentState> _fetchComment(String id) async* {
    yield CommentLoading();
    try {
      final result = await _apiComments.comment(id);
      yield result.fold((comment) => CommentSuccess(comment),
          (error) => CommentFailure(error));
    } catch (e) {
      yield CommentFailure(e.toString());
    }
  }

  Stream<CommentState> _removeComment(String id) async* {
    yield CommentLoading();
    try {
      final result = await _apiComments.remove(id);
      yield result.fold((id) {
        _homeBloc.add(RemoveComment(id));
        return CommentInitial();
      }, (error) => CommentFailure(error));
    } catch (e) {
      yield CommentFailure(e);
    }
  }
}
