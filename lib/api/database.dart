import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:randcomments/api/models/comment/comment.dart';
import 'package:randcomments/api/models/comments-list/comments-list.dart';

class DatabaseService {
  final CollectionReference _commentsCollection =
      Firestore.instance.collection('comments-collection');

  Future addComment(Comment newComment) async {
    final document = _commentsCollection.document('comments-document');
    final documentData = await document.get();
    final comments = CommentsList.fromJson(documentData.data).list;
    newComment.setId = comments.length > 0 ? comments.last.id + 1 : 0;
    return document.setData(CommentsList([...comments, newComment]).toJson());
  }

  Future removeComment(int id) async {
    final document = _commentsCollection.document('comments-document');
    final documentData = await document.get();
    final comments = CommentsList.fromJson(documentData.data).list;
    return document.setData(
        CommentsList(comments.where((c) => c.id != id).toList()).toJson());
  }

  Stream<DocumentSnapshot> initStream() {
    return _commentsCollection.document('comments-document').snapshots();
  }
}
