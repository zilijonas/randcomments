import 'package:flutter/material.dart';

class FocusContainer extends StatelessWidget {
  final Widget child;

  FocusContainer({Key key, @required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        width: double.infinity,
        color: Colors.black.withOpacity(0),
        child: child,
      ),
    );
  }
}
