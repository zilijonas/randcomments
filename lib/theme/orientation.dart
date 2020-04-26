import 'package:flutter/material.dart';

bool isLandscape(BuildContext context) =>
    MediaQuery.of(context).orientation == Orientation.landscape;

bool isPortrait(BuildContext context) =>
    MediaQuery.of(context).orientation == Orientation.portrait;
