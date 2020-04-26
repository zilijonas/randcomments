import 'package:equatable/equatable.dart';

abstract class AddNoteState extends Equatable {
  @override
  List<Object> get props => [];
}

class AddNoteInitial extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteFailure extends AddNoteState {
  final String error;

  AddNoteFailure(this.error);
}
