import 'package:flutter_test/flutter_test.dart';
import 'package:notes_app/data/data_source/note_db_helper.dart';
import 'package:notes_app/domain/model/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  sqfliteFfiInit();
  TestWidgetsFlutterBinding.ensureInitialized();
  test(
    'sqflite test code',
    () async {
      final databaseFactory = databaseFactoryFfi;
      final db = await databaseFactory.openDatabase(inMemoryDatabasePath);
      await db.execute(
          'CREATE TABLE note(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, color INTEGER, timeStamp INTEGER)');

      final noteDbHelper = NoteDbHelper(db: db);

      await noteDbHelper.insertNote(
        Note(
          title: 'test1',
          content: 'test1',
          color: 1,
          timeStamp: 1,
        ),
      );

      expect((await noteDbHelper.getNotes()).length, 1);

      Note? note = (await noteDbHelper.getNoteById(1));
      expect(note?.id, 1);

      await noteDbHelper.updateNote(note!.copyWith(title: 'change'));

      note = (await noteDbHelper.getNoteById(1));
      expect(note!.title, 'change');

      await noteDbHelper.deleteNote(note);
      expect((await noteDbHelper.getNotes()).length, 0);

      await db.close();
    },
  );
}
