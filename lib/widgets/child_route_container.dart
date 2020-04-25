import 'package:flutter/material.dart';

class ChildRouteContainer extends StatelessWidget {
  final Widget child;

  ChildRouteContainer({Key key, @required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      onHorizontalDragUpdate: (details) {
        if (details.primaryDelta > 0) {
          Navigator.pop(context);
        }
      },
      child: Container(
        width: double.infinity,
        color: Colors.black.withOpacity(0),
        child: child,
      ),
    );
  }
}
