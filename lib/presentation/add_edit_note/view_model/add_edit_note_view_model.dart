import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notes_app/domain/model/note.dart';
import 'package:notes_app/domain/repository/note_repository.dart';
import 'package:notes_app/presentation/add_edit_note/event/add_edit_note_event.dart';
import 'package:notes_app/presentation/add_edit_note/event/add_edit_note_ui_event.dart';
import 'package:notes_app/ui/common/const/colors.dart';

class AddEditNoteViewModel with ChangeNotifier {
  final NoteRepository repository;
  int _color = roseBud.value;

  int get color => _color;
  //broadCast : stream 을 여러번 재 listen 가능하게 해줌.
  final _eventController = StreamController<AddEditNoteUiEvent>.broadcast();

  Stream<AddEditNoteUiEvent> get eventStream => _eventController.stream;

  AddEditNoteViewModel({
    required this.repository,
  });

  void onEvent(AddEditNoteEvent event) {
    event.when(
      changeColor: _changeColor,
      saveNote: _saveNote,
    );
  }

  Future<void> _changeColor(int color) async {
    _color = color;
    notifyListeners();
  }

  Future<void> _saveNote(int? id, String title, String content) async {
    if (title.isEmpty || content.isEmpty) {
      _eventController.add(AddEditNoteUiEvent.showSnackBar("제목과 내용을 모두 입력 해주세요."));
      return;
    }

    if (id == null) {
      await repository.insertNote(
        Note(
          title: title,
          content: content,
          color: _color,
          timeStamp: DateTime.now().microsecondsSinceEpoch,
        ),
      );
    } else {
      await repository.updateNote(
        Note(
          id: id,
          title: title,
          content: content,
          color: color,
          timeStamp: DateTime.now().microsecondsSinceEpoch,
        ),
      );
    }
    _eventController.add(const AddEditNoteUiEvent.saveNote());
  }
}
