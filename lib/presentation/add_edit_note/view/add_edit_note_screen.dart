import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:notes_app/domain/model/note.dart';
import 'package:notes_app/presentation/add_edit_note/event/add_edit_note_event.dart';
import 'package:notes_app/presentation/add_edit_note/view_model/add_edit_note_view_model.dart';
import 'package:notes_app/ui/common/const/colors.dart';
import 'package:notes_app/ui/common/layout/default_layout.dart';
import 'package:provider/provider.dart';

class AddEditNoteScreen extends StatefulWidget {
  final Note? note;

  const AddEditNoteScreen({
    this.note,
    Key? key,
  }) : super(key: key);

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  StreamSubscription? _streamSubscription;

  final List<Color> noteColors = [
    roseBud,
    primrose,
    wisteria,
    skyBlue,
    illusion,
  ];

  @override
  void initState() {
    super.initState();

    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _contentController.text = widget.note!.content;
    }

    Future.microtask(() {
      final viewModel = context.read<AddEditNoteViewModel>();
      _streamSubscription = viewModel.eventStream.listen((event) {
        event.when(
          saveNote: () {
            Navigator.of(context).pop(true);
          },
          showSnackBar: (String message) {
            final snackBar = SnackBar(content: Text(message));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        );
      });
    });
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AddEditNoteViewModel>();

    return DefaultLayOut(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.onEvent(
            AddEditNoteEvent.saveNote(
              widget.note == null ? null : widget.note!.id,
              _titleController.text,
              _contentController.text,
            ),
          );
        },
        child: const Icon(Icons.save),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding: const EdgeInsets.only(
            right: 16.0, left: 16.0, bottom: 16.0, top: 48.0),
        color: Color(viewModel.color),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: noteColors
                  .map(
                    (color) => InkWell(
                      onTap: () {
                        viewModel.onEvent(
                          AddEditNoteEvent.changeColor(color.value),
                        );
                      },
                      child: _buildBackgroundColor(
                        color: color,
                        isSelected: viewModel.color == color.value,
                      ),
                    ),
                  )
                  .toList(),
            ),
            TextField(
              controller: _titleController,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: darkGray,
                  ),
              decoration: InputDecoration(
                hintText: "제목을 입력하세요..",
                border: InputBorder.none,
              ),
            ),
            TextField(
              controller: _contentController,
              maxLines: null,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: darkGray,
                  ),
              decoration: InputDecoration(
                hintText: "내용을 입력하세요..",
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundColor({
    required Color color,
    required bool isSelected,
  }) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5.0,
            spreadRadius: 1.0,
          ),
        ],
        border: isSelected
            ? Border.all(
                color: Colors.black,
                width: 3.0,
              )
            : null,
      ),
    );
  }
}
