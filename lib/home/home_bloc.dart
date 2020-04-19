import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:randcomments/api/database.dart';
import 'package:randcomments/home/index.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DatabaseService _database = DatabaseService();

  HomeBloc() {
    _database.initStream().listen((data) => _inFirestore.add(data));
  }

  final _firestoreController = StreamController<DocumentSnapshot>();
  Stream<DocumentSnapshot> get outFirestore => _firestoreController.stream;
  Sink<DocumentSnapshot> get _inFirestore => _firestoreController.sink;

  @override
  HomeState get initialState => HomeInitial();

  @override
  Future<void> close() {
    _firestoreController.close();
    return super.close();
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is AddCommentClicked) {
      yield HomeLoading();
      await _database.addComment(event.comment);
      yield HomeSuccess();
    }

    if (event is RemoveCommentClicked) {
      yield HomeLoading();
      await _database.removeComment(event.id);
      yield HomeSuccess();
    }
  }
}
