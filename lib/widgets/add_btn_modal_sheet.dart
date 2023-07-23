import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/constants.dart';

import 'add_note_form.dart';
import 'custom_btn.dart';
import 'custom_text_field.dart';

class AddModalBtnSheet extends StatelessWidget {
  const AddModalBtnSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: BlocConsumer<AddNotesCubit, AddNotesState>(
          listener: (context, state) {
        if (state is AddNotesFailure) {
          print('faild ${state.errMessage}');
          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:()));
        }
        if (state is AddNotesSuccess) {
          BlocProvider.of<NotesCubit>(context).fetchAllNotes();
          Navigator.pop(context);
        }
      }, builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is AddNotesLoading ? true : false,
          child: Padding(
            padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const SingleChildScrollView(child: AddNoteForm()),
          ),
        );
      }),
    );
  }
}
