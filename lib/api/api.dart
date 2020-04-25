import 'package:dio/dio.dart';

import 'add-comment-request.dart';
import 'comment/comment.dart';

class Api {
  final Dio _dio;
  Api(this._dio);

  Future<Comment> addComment(AddCommentRequest comment) async {
    final response =
        await _dio.post('addComment', queryParameters: comment.toQueryPrams());
    return Comment.fromJson(response.data);
  }

  Future<String> removeComment(String id) async {
    final response =
        await _dio.post('removeComment', queryParameters: {"id": id});
    return response.data["id"];
  }

  Future<List<Comment>> comments() async {
    final response = await _dio.get('getComments');
    return response.data["comments"]
        .map<Comment>((c) => Comment.fromJson(c))
        .toList();
  }

  Future<Comment> comment(String id) async {
    final response = await _dio.post('getComment', queryParameters: {"id": id});
    return Comment.fromJson(response.data);
  }
}
