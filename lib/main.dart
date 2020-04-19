import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home/index.dart';

void main() {
  runApp(RandCommentsApp());
}

class RandCommentsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiBlocProvider(
      providers: [BlocProvider<HomeBloc>(create: (c) => HomeBloc())],
      child: MaterialApp(
        title: 'Random Comments',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ));
}
