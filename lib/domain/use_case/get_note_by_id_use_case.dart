import 'package:notes_app/domain/model/note.dart';
import 'package:notes_app/domain/repository/note_repository.dart';

class GetNoteByIdUseCase {
  final NoteRepository repository;

  GetNoteByIdUseCase({
    required this.repository,
  });

  Future<Note?> call(int id) async {
    final Note? note = await repository.getNoteById(id);
    return note;
  }
}
