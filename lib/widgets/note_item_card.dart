import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';

import '../models/note_model.dart';
import '../views/edit_notes_view.dart';
import 'edite_view_body.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.color,
    required this.note,
  });

  final dynamic color;
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return  EditNoteView(
              note: note,
            );
          }),
        );
      },
      child: Container(
        padding:
            const EdgeInsets.only(top: 30, bottom: 30, left: 16, right: 24),
        decoration: BoxDecoration(
            color: Color(note.color),
            //  color

            borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Text(
                  note.subTitle,
                  style: const TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
              trailing: IconButton(
                  onPressed: () {
                    note.delete();
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes() ;
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 30,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 16,
                top: 30,
              ),
              child: Text(
                note.date,
                style: const TextStyle(color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}
