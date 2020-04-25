import 'package:flutter/material.dart';
import 'package:randcomments/api/note/note.dart';

class NotesListItem extends StatelessWidget {
  final Note _note;
  final void Function() _onItemClicked;

  NotesListItem(this._note, this._onItemClicked);

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
            _noteText(_note.content),
            _dateAndTimeText(_note.dateAndTime()),
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

  Expanded _noteText(String note) {
    return Expanded(
      child: Container(
        child: Text(
          note,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: note.length > 50 ? 18 : 24),
        ),
      ),
    );
  }
}
