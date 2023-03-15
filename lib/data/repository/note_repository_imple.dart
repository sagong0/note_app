import 'package:notes_app/data/data_source/note_db_helper.dart';
import 'package:notes_app/domain/model/note.dart';
import 'package:notes_app/domain/repository/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteDbHelper noteDbHelper;

  NoteRepositoryImpl({
    required this.noteDbHelper,
  });
  @override
  Future<Note?> getNoteById(int id) async {
    return await noteDbHelper.getNoteById(id);
  }

  @override
  Future<List<Note>> getNotes() async {
    return await noteDbHelper.getNotes();
  }

  @override
  Future<void> insertNote(Note note) async {
    await noteDbHelper.insertNote(note);
  }

  @override
  Future<void> updateNote(Note note) async {
    await noteDbHelper.updateNote(note);
  }

  @override
  Future<void> deleteNote(Note note) async {
    await noteDbHelper.deleteNote(note);
  }
}
