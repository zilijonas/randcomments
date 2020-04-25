import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randcomments/comment/comment_bloc.dart';
import 'package:randcomments/router/router.dart';

import 'api/api.dart';
import 'home/index.dart';
import 'infrastructure/api-comments.dart';

void main() {
  Dio dio = Dio(BaseOptions(
      baseUrl: "https://us-central1-comments-api-68c56.cloudfunctions.net/"));
  final api = Api(dio);
  final apiComments = ApiComments(api);
  runApp(RandCommentsApp(apiComments));
}

class RandCommentsApp extends StatelessWidget {
  final ApiComments _apiComments;
  RandCommentsApp(this._apiComments);

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
          providers: [
            BlocProvider<HomeBloc>(create: (context) => HomeBloc(_apiComments)),
            BlocProvider<CommentBloc>(
                create: (context) => CommentBloc(
                    _apiComments, BlocProvider.of<HomeBloc>(context)))
          ],
          child: MaterialApp(
            title: 'Random Comments',
            theme: ThemeData(primarySwatch: Colors.deepPurple),
            home: HomePage(),
            onGenerateRoute: Router.generateRoute,
          ));
}
