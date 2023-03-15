import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_app/domain/model/note.dart';
import 'package:notes_app/domain/util/note_order.dart';

part 'notes_state.freezed.dart';

@freezed
class NotesState with _$NotesState {
  const factory NotesState({
    @Default([]) List<Note> notes,
    required NoteOrder noteOrder,
    required bool isOrderSectionVisible,
  }) = _NotesState;
}
