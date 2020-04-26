import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:randcomments/api/add_note_request.dart';
import 'package:randcomments/api/note/note.dart';
import 'package:randcomments/infrastructure/fakes/fake_notes.dart';
import 'package:randcomments/pages/index.dart';

class MockHomeBloc extends Mock implements HomeBloc {}

void main() {
  final fakeError = 'error';
  final fakeNote = Note('0', 'test', DateTime.now());

  AddNoteBloc _sut([HomeBloc bloc, bool success = true]) => AddNoteBloc(
      FakeNotes(fakeNote, success ? null : fakeError),
      bloc ?? HomeBloc(FakeNotes(fakeNote)));

  test('initial state is AddNoteInitial', () {
    expect(AddNoteInitial(), _sut().initialState);
  });

  test('close does not emit new states', () {
    final sut = _sut();
    expectLater(sut, emitsInOrder([AddNoteInitial(), emitsDone]));
    sut.close();
  });

  group('SubmitClicked', () {
    test('emits AddNote in homeBloc', () {
      final homeBloc = MockHomeBloc();
      final sut = _sut(homeBloc);

      expectLater(
          sut,
          emitsInOrder([
            AddNoteInitial(),
            AddNoteLoading(),
            AddNoteInitial(),
          ])).then((_) {
        verify(homeBloc.add(AddNote(fakeNote))).called(1);
      });

      sut.add(SubmitClicked(AddNoteRequest(fakeNote.content)));
      homeBloc.close();
    });

    test('does not emit AddNote in homeBloc on failure', () {
      final homeBloc = MockHomeBloc();
      final sut = _sut(homeBloc, false);

      expectLater(
          sut,
          emitsInOrder([
            AddNoteInitial(),
            AddNoteLoading(),
            AddNoteFailure(fakeError),
          ])).then((_) {
        verifyNever(homeBloc.add(AddNote(fakeNote)));
      });

      sut.add(SubmitClicked(AddNoteRequest(fakeNote.content)));
      homeBloc.close();
    });
  });
}
