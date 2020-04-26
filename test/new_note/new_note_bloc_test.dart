import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:randcomments/api/new_note_request.dart';
import 'package:randcomments/api/note/note.dart';
import 'package:randcomments/infrastructure/fakes/fake_notes.dart';
import 'package:randcomments/pages/index.dart';

class MockHomeBloc extends Mock implements HomeBloc {}

void main() {
  final fakeError = 'error';
  final fakeNote = Note('0', 'test', DateTime.now());

  NewNoteBloc _sut([HomeBloc bloc, bool success = true]) => NewNoteBloc(
      FakeNotes(fakeNote, success ? null : fakeError),
      bloc ?? HomeBloc(FakeNotes(fakeNote)));

  test('initial state is NewNoteInitial', () {
    expect(NewNoteInitial(), _sut().initialState);
  });

  test('close does not emit new states', () {
    final sut = _sut();
    expectLater(sut, emitsInOrder([NewNoteInitial(), emitsDone]));
    sut.close();
  });

  group('SubmitClicked', () {
    test('emits NewNote in homeBloc', () {
      final homeBloc = MockHomeBloc();
      final sut = _sut(homeBloc);

      expectLater(
          sut,
          emitsInOrder([
            NewNoteInitial(),
            NewNoteLoading(),
            NewNoteInitial(),
          ])).then((_) {
        verify(homeBloc.add(NewNote(fakeNote))).called(1);
      });

      sut.add(SubmitClicked(NewNoteRequest(fakeNote.content)));
      homeBloc.close();
    });

    test('does not emit NewNote in homeBloc on failure', () {
      final homeBloc = MockHomeBloc();
      final sut = _sut(homeBloc, false);

      expectLater(
          sut,
          emitsInOrder([
            NewNoteInitial(),
            NewNoteLoading(),
            NewNoteFailure(fakeError),
          ])).then((_) {
        verifyNever(homeBloc.add(NewNote(fakeNote)));
      });

      sut.add(SubmitClicked(NewNoteRequest(fakeNote.content)));
      homeBloc.close();
    });
  });
}
