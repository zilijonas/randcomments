import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' show DioError;
import 'package:randcomments/api/add-comment-request.dart';
import 'package:randcomments/api/api.dart';
import 'package:randcomments/api/comment/comment.dart';
import 'package:randcomments/api/common/order-by-child.dart';
import 'package:randcomments/api/common/order-direction.dart';

class ApiComments {
  final Api _api;
  ApiComments(this._api);

  Future<Either<List<Comment>, String>> comments(
      OrderByChild orderByChild, OrderDirection direction) async {
    try {
      return Left(await _api.getComments(orderByChild, direction));
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
