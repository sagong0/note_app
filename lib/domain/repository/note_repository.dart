import 'package:notes_app/domain/model/note.dart';

abstract class NoteRepository{
  // 노트 전체 가져오기
  Future<List<Note>> getNotes();
  // 노트 디테일
  Future<Note?> getNoteById(int id);
  // 노트 추가
  Future<void> insertNote(Note note);
  // 노트 업데이트
  Future<void> updateNote(Note note);
  // 노트 삭제
  Future<void> deleteNote(Note note);
}