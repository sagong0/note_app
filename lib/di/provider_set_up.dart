import 'package:notes_app/data/data_source/note_db_helper.dart';
import 'package:notes_app/data/repository/note_repository_imple.dart';
import 'package:notes_app/domain/repository/note_repository.dart';
import 'package:notes_app/domain/use_case/add_note_use_case.dart';
import 'package:notes_app/domain/use_case/delete_note_use_case.dart';
import 'package:notes_app/domain/use_case/get_note_by_id_use_case.dart';
import 'package:notes_app/domain/use_case/get_notes_use_case.dart';
import 'package:notes_app/domain/use_case/update.note_use_case.dart';
import 'package:notes_app/domain/use_case/use_cases.dart';
import 'package:notes_app/presentation/add_edit_note/view_model/add_edit_note_view_model.dart';
import 'package:notes_app/presentation/notes/view_model/notes_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sqflite/sqflite.dart';

Future<List<SingleChildWidget>> getProviders() async {
  Database database = await openDatabase(
    'note_db',
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
        'CREATE TABLE note(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, color INTEGER, timeStamp INTEGER)',
      );
    },
  );


  NoteDbHelper noteDbHelper = NoteDbHelper(db: database);
  NoteRepository noteRepository =
      NoteRepositoryImpl(noteDbHelper: noteDbHelper);
  UseCases useCases = UseCases(
    addNote: AddNoteUseCase(repository: noteRepository),
    deleteNote: DeleteNoteUseCase(repository: noteRepository),
    getNoteById: GetNoteByIdUseCase(repository: noteRepository),
    getNotes: GetNotesUseCase(repository: noteRepository),
    updateNote: UpdateNoteUseCase(repository: noteRepository),
  );
  NotesViewModel notesViewModel = NotesViewModel(useCases: useCases);
  AddEditNoteViewModel addEditNoteViewModel =
      AddEditNoteViewModel(repository: noteRepository);

  return [
    ChangeNotifierProvider(create: (_) => notesViewModel),
    ChangeNotifierProvider(create: (_) => addEditNoteViewModel),
  ];
}
