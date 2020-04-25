import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' show DioError;
import 'package:randcomments/api/add-comment-request.dart';
import 'package:randcomments/api/api.dart';
import 'package:randcomments/api/comment/comment.dart';

class ApiComments {
  final Api _api;
  ApiComments(this._api);

  Future<Either<List<Comment>, String>> comments() async {
    try {
      return Left(await _api.getComments());
    } on DioError catch (error) {
      return Right(error.message);
    }
  }

  Future<Either<Comment, String>> add(AddCommentRequest comment) async {
    try {
      return Left(await _api.addComment(comment));
    } on DioError catch (error) {
      return Right(error.message);
    }
  }

  Future<Either<String, String>> remove(String id) async {
    try {
      return Left(await _api.removeComment(id));
    } on DioError catch (error) {
      return Right(error.message);
    }
  }
}
