import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randcomments/add_note/add_note_bloc.dart';
import 'package:randcomments/note/note_bloc.dart';
import 'package:randcomments/router/router.dart';
import 'package:randcomments/router/routes.dart';

import 'api/api.dart';
import 'home/index.dart';
import 'infrastructure/api_notes.dart';

void main() {
  Dio dio = Dio(BaseOptions(
      baseUrl: "https://us-central1-comments-api-68c56.cloudfunctions.net/"));
  final api = Api(dio);
  final apiNotes = ApiNotes(api);
  runApp(RandNotesApp(apiNotes));
}

class RandNotesApp extends StatelessWidget {
  final ApiNotes _apiNotes;
  RandNotesApp(this._apiNotes);

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
          providers: [
            BlocProvider<HomeBloc>(create: (context) => HomeBloc(_apiNotes)),
            BlocProvider<NoteBloc>(
                create: (context) =>
                    NoteBloc(_apiNotes, BlocProvider.of<HomeBloc>(context))),
            BlocProvider<AddNoteBloc>(
                create: (context) =>
                    AddNoteBloc(_apiNotes, BlocProvider.of<HomeBloc>(context))),
          ],
          child: MaterialApp(
            title: 'Random Notes',
            theme: ThemeData(
                primarySwatch: Colors.blue,
                backgroundColor: Colors.lightBlue,
                scaffoldBackgroundColor: Colors.lightBlue[100]),
            onGenerateRoute: Router.generateRoute,
            initialRoute: homeRoute,
          ));
}
