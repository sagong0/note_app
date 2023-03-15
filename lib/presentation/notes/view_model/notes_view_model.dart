import 'package:flutter/cupertino.dart';
import 'package:notes_app/domain/model/note.dart';
import 'package:notes_app/domain/use_case/use_cases.dart';
import 'package:notes_app/domain/util/note_order.dart';
import 'package:notes_app/domain/util/order_type.dart';
import 'package:notes_app/presentation/notes/event/notes_event.dart';
import 'package:notes_app/presentation/notes/state/notes_state.dart';

class NotesViewModel with ChangeNotifier {
  final UseCases useCases;

  NotesState _notesState = const NotesState(
    noteOrder: NoteOrder.date(OrderType.descending()),
    isOrderSectionVisible: false,
  );

  NotesState get notesState => _notesState;

  Note? _recentlyDeletedNote;

  NotesViewModel({
    required this.useCases,
  }) {
    _loadNotes();
  }

  void event(NotesEvent event) {
    event.when(
      loadNotes: _loadNotes,
      deleteNote: _deleteNote,
      restoreNote: _restoreNote,
      changeOrder: (NoteOrder noteOrder) {
        _notesState = _notesState.copyWith(noteOrder: noteOrder);
        _loadNotes();
      },
      toggleOrderSection: () {
        _notesState = _notesState.copyWith(isOrderSectionVisible: !_notesState.isOrderSectionVisible);
        notifyListeners();
      },
    );
  }

  Future<void> _loadNotes() async {
    List<Note> notes = await useCases.getNotes(notesState.noteOrder);
    _notesState = _notesState.copyWith(notes: notes);
    notifyListeners();
  }

  Future<void> _deleteNote(Note note) async {
    await useCases.deleteNote(note);
    _recentlyDeletedNote = note;
    await _loadNotes();
  }

  Future<void> _restoreNote() async {
    if (_recentlyDeletedNote != null) {
      await useCases.addNote(_recentlyDeletedNote!);
      _recentlyDeletedNote = null;
      await _loadNotes();
      notifyListeners();
    }
  }
}
