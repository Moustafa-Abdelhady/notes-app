import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

import '../../models/note_model.dart';
import '../../widgets/constants.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;

  fetchAllNotes() async {
    var notesBox = Hive.box<NoteModel>(kNotesBox);

     notes = notesBox.values.toList();
    emit(NotesSuccess());
  }
}
