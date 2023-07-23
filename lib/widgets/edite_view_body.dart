import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';

import '../cubits/add_notes_cubit/add_notes_cubit.dart';
import '../models/note_model.dart';
import 'colors_list_view.dart';
import 'constants.dart';
import 'custom_text_field.dart';
import 'edit_note_color_list_view.dart';

class EditeNoteViewBody extends StatefulWidget {
  const EditeNoteViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditeNoteViewBody> createState() => _EditeNoteViewBodyState();
}

class _EditeNoteViewBodyState extends State<EditeNoteViewBody> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
            onPressed: () {
              // if(title != null){
              //      widget.note.title = title! ;
              // }  or
              widget.note.title = title ?? widget.note.title;

              widget.note.subTitle = content ?? widget.note.subTitle;

              widget.note.save();

              BlocProvider.of<NotesCubit>(context).fetchAllNotes();

              Navigator.pop(context);

              showBottomSheet(
                  context: context,
                  builder: (context) {
                    return Text('Success');
                  });
            },
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
            hint: widget.note.title,
            onChanged: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
            hint: widget.note.subTitle,
            maxLines: 5,
            onChanged: (value) {
              content = value;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          EditeNotesColorList(
            note: widget.note,
          ),
        ],
      ),
    );
  }
}
