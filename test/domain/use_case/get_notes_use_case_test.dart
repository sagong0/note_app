import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notes_app/domain/model/note.dart';
import 'package:notes_app/domain/repository/note_repository.dart';
import 'package:notes_app/domain/use_case/get_notes_use_case.dart';
import 'package:notes_app/domain/util/note_order.dart';
import 'package:notes_app/domain/util/order_type.dart';

import 'get_notes_use_case_test.mocks.dart';

@GenerateMocks([NoteRepository])
void main() {
  test('정렬 기능이 잘 작동해야 한다.', () async {
    final repository = MockNoteRepository();
    final getNotes = GetNotesUseCase(repository: repository);

    // 동작 정의
    when(repository.getNotes()).thenAnswer(
      (_) async => [
        Note(title: 'title1', content: 'content1', color: 1, timeStamp: 1),
        Note(title: 'title2', content: 'content2', color: 2, timeStamp: 2),
      ],
    );

    List<Note> result = await getNotes.call(const NoteOrder.date(OrderType.descending()));
    expect(result, isA<List<Note>>());
    expect(result.first.timeStamp, 2);
    verify(repository.getNotes());

    result = await getNotes.call(const NoteOrder.date(OrderType.ascending()));
    expect(result.first.timeStamp, 1);
    verify(repository.getNotes());

    result = await getNotes.call(const NoteOrder.title(OrderType.ascending()));
    expect(result.first.title, 'title1');
    verify(repository.getNotes());

    result = await getNotes.call(const NoteOrder.title(OrderType.descending()));
    expect(result.first.title, 'title2');
    verify(repository.getNotes());

    result = await getNotes.call(const NoteOrder.color(OrderType.ascending()));
    expect(result.first.color, 1);
    verify(repository.getNotes());

    result = await getNotes.call(const NoteOrder.color(OrderType.descending()));
    expect(result.first.color, 2);
    verify(repository.getNotes());

    verifyNoMoreInteractions(repository);
  });
}
