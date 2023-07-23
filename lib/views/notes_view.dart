import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/notes_cubit/notes_cubit.dart';
import '../widgets/add_btn_modal_sheet.dart';
import '../widgets/constants.dart';
import '../widgets/ntes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                context: context,
                builder: (context) {
                  return AddModalBtnSheet();
                });
          },
          child: const Icon(Icons.add),
          backgroundColor: kprimaryColor),
      body: const NotesViewBody(),
    );
  }
}
