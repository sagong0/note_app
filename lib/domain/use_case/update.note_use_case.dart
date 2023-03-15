import 'package:notes_app/domain/model/note.dart';
import 'package:notes_app/domain/repository/note_repository.dart';

class UpdateNoteUseCase {
  final NoteRepository repository;

  UpdateNoteUseCase({
    required this.repository,
  });

  Future<void> call(Note note)async{
    await repository.updateNote(note);
  }
}
