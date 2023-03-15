import 'package:flutter/material.dart';
import 'package:notes_app/domain/model/note.dart';

class NoteItem extends StatelessWidget {
  final Note note;
  final VoidCallback? onDeleteTap;

  const NoteItem({
    required this.note,
    this.onDeleteTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(note.color),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 8.0),
                Text(
                  note.content,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: GestureDetector(
              onTap: onDeleteTap,
              child: const Icon(Icons.delete),
            ),
          )
        ],
      ),
    );
  }
}
