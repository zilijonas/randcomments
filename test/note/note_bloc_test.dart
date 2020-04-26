import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:randcomments/api/edit_note_request.dart';
import 'package:randcomments/api/note/note.dart';
import 'package:randcomments/infrastructure/fakes/fake_notes.dart';
import 'package:randcomments/pages/index.dart';

class MockHomeBloc extends Mock implements HomeBloc {}

void main() {
  final fakeError = 'error';
  final fakeNote = Note('0', 'test', true, DateTime.now());

  NoteBloc _sut([HomeBloc bloc, bool success = true]) => NoteBloc(
      FakeNotes(fakeNote, success ? null : fakeError),
      bloc ?? HomeBloc(FakeNotes(fakeNote)));

  test('initial state is NewNoteInitial', () {
    expect(NoteInitial(), _sut().initialState);
  });

  test('close does not emit new states', () {
    final sut = _sut();
    expectLater(sut, emitsInOrder([NoteInitial(), emitsDone]));
    sut.close();
  });

  group('EditSaveClicked', () {
    test('emits EditNote in homeBloc', () {
      final homeBloc = MockHomeBloc();
      final sut = _sut(homeBloc);

      expectLater(
          sut,
          emitsInOrder([
            NoteInitial(),
            NoteEditLoading(),
            NoteInitial(),
          ])).then((_) {
        verify(homeBloc.add(EditNote(fakeNote))).called(1);
      });

      sut.add(EditSaveClicked(
          EditNoteRequest(fakeNote.id, fakeNote.content, fakeNote.editable)));
      homeBloc.close();
    });

    test('does not emit EditNote in homeBloc on failure', () {
      final homeBloc = MockHomeBloc();
      final sut = _sut(homeBloc, false);

      expectLater(
          sut,
          emitsInOrder([
            NoteInitial(),
            NoteEditLoading(),
            NoteFailure(fakeError),
          ])).then((_) {
        verifyNever(homeBloc.add(EditNote(fakeNote)));
      });

      sut.add(EditSaveClicked(
          EditNoteRequest(fakeNote.id, fakeNote.content, fakeNote.editable)));
      homeBloc.close();
    });
  });
}
