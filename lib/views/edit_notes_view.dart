import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../models/note_model.dart';
import '../widgets/edite_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key,required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: EditeNoteViewBody(
        note: note,
      ),
    );
  }
}
