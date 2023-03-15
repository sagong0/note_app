import 'package:notes_app/domain/model/note.dart';
import 'package:notes_app/domain/repository/note_repository.dart';

class DeleteNoteUseCase {
  final NoteRepository repository;

  DeleteNoteUseCase({
    required this.repository,
  });

  Future<void> call(Note note)async{
    await repository.deleteNote(note);
  }
}
