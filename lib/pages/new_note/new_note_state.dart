import 'package:equatable/equatable.dart';

abstract class NewNoteState extends Equatable {
  @override
  List<Object> get props => [];
}

class NewNoteInitial extends NewNoteState {}

class NewNoteLoading extends NewNoteState {}

class NewNoteFailure extends NewNoteState {
  final String error;

  NewNoteFailure(this.error);
}
