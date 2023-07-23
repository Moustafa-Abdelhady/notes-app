import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import 'note_item_card.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  final data = const [
    Colors.yellow,
    Color.fromARGB(255, 255, 185, 209),
    Colors.greenAccent,
    Colors.deepPurple,
    Colors.amber,
    Color.fromARGB(255, 76, 114, 180),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notesList = BlocProvider.of<NotesCubit>(context).notes! ;
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: notesList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: NoteItem(
                  note:notesList[index],
                  color: data[index],
                   
                ),
              );
            },
          ),
        );
      },
    );
  }
}
