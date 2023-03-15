import 'package:flutter/material.dart';
import 'package:notes_app/presentation/add_edit_note/view/add_edit_note_screen.dart';
import 'package:notes_app/presentation/notes/component/note_item.dart';
import 'package:notes_app/presentation/notes/component/order_section.dart';
import 'package:notes_app/presentation/notes/event/notes_event.dart';
import 'package:notes_app/presentation/notes/view_model/notes_view_model.dart';
import 'package:notes_app/ui/common/layout/default_layout.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NotesViewModel>();
    final state = viewModel.notesState;

    return DefaultLayOut(
      title: "Your Note",
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              viewModel.event(NotesEvent.toggleOrderSection());
            });
          },
          icon: const Icon(Icons.sort),
        ),
      ],
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          bool? isSaved = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const AddEditNoteScreen(),
            ),
          );
          if (isSaved != null && isSaved) {
            viewModel.event(NotesEvent.loadNotes());
          }
        },
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: state.isOrderSectionVisible
                  ? OrderSection(
                      noteOrder: state.noteOrder,
                      onOrderChanged: (noteOrder) {
                        viewModel.event(NotesEvent.changeOrder(noteOrder));
                      },
                    )
                  : Container(),
            ),
            ...state.notes
                .map(
                  (note) => GestureDetector(
                    onTap: () async {
                      bool? isSaved = await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => AddEditNoteScreen(note: note),
                        ),
                      );
                      if (isSaved != null && isSaved) {
                        viewModel.event(NotesEvent.loadNotes());
                      }
                    },
                    child: NoteItem(
                      note: note,
                      onDeleteTap: () {
                        viewModel.event(
                          NotesEvent.deleteNote(note),
                        );
                        final snackBar = SnackBar(
                          content: const Text("삭제 되었습니다."),
                          action: SnackBarAction(
                            label: '취소',
                            onPressed: () {
                              viewModel.event(NotesEvent.restoreNote());
                            },
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
