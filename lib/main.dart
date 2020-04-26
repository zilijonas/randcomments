import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randcomments/router/router.dart';
import 'package:randcomments/router/routes.dart';
import 'package:randcomments/theme/colors.dart';

import 'api/api.dart';
import 'infrastructure/api_notes.dart';
import 'pages/index.dart';

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
            BlocProvider<NewNoteBloc>(
                create: (context) =>
                    NewNoteBloc(_apiNotes, BlocProvider.of<HomeBloc>(context))),
          ],
          child: MaterialApp(
            title: 'Random Notes',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              indicatorColor: ThemeColors.white,
              splashColor: ThemeColors.lightBlue,
              accentColor: ThemeColors.white,
              scaffoldBackgroundColor: ThemeColors.blue,
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                  foregroundColor: ThemeColors.darkBlue,
                  backgroundColor: ThemeColors.white),
            ),
            onGenerateRoute: Router.generateRoute,
            initialRoute: homeRoute,
            builder: (context, child) => child,
          ));
}
