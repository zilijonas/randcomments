import 'package:flutter/material.dart';
import 'package:randcomments/theme/colors.dart';

class FormRouteContainer extends StatelessWidget {
  final Widget child;

  FormRouteContainer({Key key, @required this.child});

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
        color: ThemeColors.black.withOpacity(0),
        child: SingleChildScrollView(
            child: SizedBox(
                height: MediaQuery.of(context).size.height, child: child)),
      ),
    );
  }
}
