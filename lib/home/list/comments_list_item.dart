import 'package:flutter/material.dart';
import 'package:randcomments/api/comment/comment.dart';

class CommentsListItem extends StatelessWidget {
  final Comment _comment;
  final void Function() _onItemClicked;

  CommentsListItem(this._comment, this._onItemClicked);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 100.0,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _commentText(_comment.content),
            _dateAndTimeText(_comment.dateAndTime()),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0),
              blurRadius: 6.0,
            ),
          ],
        ),
      ),
      onTap: _onItemClicked,
    );
  }

  Row _dateAndTimeText(String dateAndTime) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          dateAndTime,
          textAlign: TextAlign.right,
          style: TextStyle(fontSize: 10, color: Colors.black45),
        ),
      ],
    );
  }

  Expanded _commentText(String comment) {
    return Expanded(
      child: Container(
        child: Text(
          comment,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: comment.length > 50 ? 18 : 24),
        ),
      ),
    );
  }
}
