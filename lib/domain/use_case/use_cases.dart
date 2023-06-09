import 'package:notes_app/domain/use_case/add_note_use_case.dart';
import 'package:notes_app/domain/use_case/delete_note_use_case.dart';
import 'package:notes_app/domain/use_case/get_note_by_id_use_case.dart';
import 'package:notes_app/domain/use_case/get_notes_use_case.dart';
import 'package:notes_app/domain/use_case/update.note_use_case.dart';

class UseCases {
  final AddNoteUseCase addNote;
  final DeleteNoteUseCase deleteNote;
  final GetNoteByIdUseCase getNoteById;
  final GetNotesUseCase getNotes;
  final UpdateNoteUseCase updateNote;

  UseCases({
    required this.addNote,
    required this.deleteNote,
    required this.getNoteById,
    required this.getNotes,
    required this.updateNote,
  });
}
