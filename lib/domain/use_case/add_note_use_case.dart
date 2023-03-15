import 'package:notes_app/domain/model/note.dart';
import 'package:notes_app/domain/repository/note_repository.dart';

class AddNoteUseCase {
  final NoteRepository repository;

  AddNoteUseCase({
    required this.repository,
  });

  Future<void> call(Note note)async{
    await repository.insertNote(note);
  }
}
