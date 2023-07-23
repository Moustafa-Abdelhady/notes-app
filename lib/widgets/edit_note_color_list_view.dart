
import 'package:flutter/material.dart';

import '../models/note_model.dart';
import 'colors_list_view.dart';
import 'constants.dart';

class EditeNotesColorList extends StatefulWidget {
  const EditeNotesColorList({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditeNotesColorList> createState() => _EditeNotesColorListState();
}

class _EditeNotesColorListState extends State<EditeNotesColorList> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3,),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                widget.note.color = kColors[index].value;
                setState(() {});
              },
              child: ColorItem(
                 color: kColors[index],
                clrIsActive: currentIndex == index,
               
              ),
            ),
          );
        },
      ),
    );
    ;
  }
}
