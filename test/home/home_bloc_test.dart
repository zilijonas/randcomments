import 'package:flutter_test/flutter_test.dart';
import 'package:randcomments/api/note/note.dart';
import 'package:randcomments/infrastructure/fakes/fake_notes.dart';
import 'package:randcomments/pages/index.dart';

void main() {
  final fakeError = 'error';
  final fakeNote = Note('0', 'test', true, DateTime.now());

  HomeBloc _sut([bool success = true]) =>
      HomeBloc(FakeNotes(fakeNote, success ? null : fakeError));

  test('initial state is HomeInitial', () {
    expect(_sut().initialState, HomeInitial());
  });

  test('close does not emit new states', () {
    final sut = _sut();
    expectLater(sut, emitsInOrder([HomeInitial(), emitsDone]));
    sut.close();
  });

  test('NewNotec emits [initial, loading, success]', () {
    final sut = _sut();

    expectLater(
        sut,
        emitsInOrder([
          HomeInitial(),
          HomeLoading(),
          HomeSuccess([fakeNote]),
        ]));

    sut.add(NewNote(fakeNote));
  });

  test('EditNote emits [initial, loading, success]', () {
    final sut = _sut();

    expectLater(
        sut,
        emitsInOrder([
          HomeInitial(),
          HomeLoading(),
          HomeSuccess([fakeNote]),
        ]));

    sut.add(EditNote(fakeNote));
  });

  test('RemoveNote emits [initial, loading, success]', () {
    final sut = _sut();

    expectLater(
        sut,
        emitsInOrder([
          HomeInitial(),
          HomeLoading(),
          HomeSuccess([]),
        ]));

    sut.add(RemoveNote(fakeNote.id));
  });

  group('HomeInitiated', () {
    test('emits [initial, loading, success]', () {
      final sut = _sut();

      expectLater(
          sut,
          emitsInOrder([
            HomeInitial(),
            HomeLoading(),
            HomeSuccess([fakeNote]),
          ]));

      sut.add(HomeInitiated());
    });

    test('emits  [initial, loading, failure] on failure', () {
      final sut = _sut(false);

      expectLater(
          sut,
          emitsInOrder([
            HomeInitial(),
            HomeLoading(),
            HomeFailure(fakeError),
          ]));

      sut.add(HomeInitiated());
    });
  });
}
