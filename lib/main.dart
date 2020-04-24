import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            BlocProvider<HomeBloc>(create: (c) => HomeBloc(_apiComments))
          ],
          child: MaterialApp(
            title: 'Random Comments',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: HomePage(),
          ));
}
