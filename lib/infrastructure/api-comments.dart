import 'package:randcomments/api/add-comment-request.dart';
import 'package:randcomments/api/api.dart';
import 'package:randcomments/api/comment/comment.dart';

class ApiComments {
  final Api _api;
  ApiComments(this._api);

  Future<List<Comment>> comments() async {
    try {
      return await _api.getComments();
    } on Error catch (error) {
      print(error);
    }
  }

  Future<Comment> add(AddCommentRequest comment) async {
    try {
      return await _api.addComment(comment);
    } on Error catch (error) {
      print(error);
    }
  }

  Future<String> remove(String id) async {
    try {
      return await _api.removeComment(id);
    } on Error catch (error) {
      print(error);
    }
  }
}
