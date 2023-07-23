import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_cubit.dart';

import 'constants.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.clrIsActive, required this.color});

  final bool clrIsActive;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return clrIsActive
        ? CircleAvatar(
            radius: 38,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 27,
              backgroundColor: color,
              // child: ,
            ),
          )
        : CircleAvatar(
            radius: 38,
            backgroundColor: color,
            // child: ,
          );
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({
    super.key,
  });

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentIndex = 0;

 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                BlocProvider.of<AddNotesCubit>(context).color = kColors[index];
                setState(() {});
              },
              child: ColorItem(
                clrIsActive: currentIndex == index,
                color: kColors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
