import 'package:notes_app/domain/model/note.dart';
import 'package:notes_app/domain/repository/note_repository.dart';
import 'package:notes_app/domain/util/note_order.dart';
import 'package:notes_app/domain/util/order_type.dart';

class GetNotesUseCase {
  final NoteRepository repository;

  GetNotesUseCase({
    required this.repository,
  });

  Future<List<Note>> call(NoteOrder noteOrder) async {
    final List<Note> notes = await repository.getNotes();

    noteOrder.when(
      title: (OrderType orderType) {
        orderType.when(
          ascending: () {
            notes.sort((a, b) => a.title.compareTo(b.title));
          },
          descending: () {
            notes.sort((a, b) => -a.title.compareTo(b.title));
          },
        );
      },
      date: (OrderType orderType) {
        orderType.when(
          ascending: () {
            notes.sort((a, b) => a.timeStamp.compareTo(b.timeStamp));
          },
          descending: () {
            notes.sort((a, b) => -a.timeStamp.compareTo(b.timeStamp));
          },
        );
      },
      color: (OrderType orderType) {
        orderType.when(
          ascending: () {
            notes.sort((a, b) => a.color.compareTo(b.color));
          },
          descending: () {
            notes.sort((a, b) => -a.color.compareTo(b.color));
          },
        );
      },
    );

    return notes;
  }
}
