import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/notes_cubit/notes_cubit.dart';
import 'custom_app_bar.dart';
import 'note_item_card.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      child: Column(
        children: [
          // SizedBox(height: 5,width:80,),
          CustomAppBar(
            title: 'Notes',
            icon: Icons.search,
          ),
          const SizedBox(
            height: 7,
          ),
          Expanded(child: NotesListView())
        ],
      ),
    );
  }
}
