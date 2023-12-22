import 'package:flutter/material.dart';

// constants
import 'package:notes_app/constants.dart';

// models
import 'package:notes_app/models/noteModel.dart';

// widgets
import 'package:notes_app/widgets/colorItems.dart';

class EditNoteColorList extends StatefulWidget {
  const EditNoteColorList({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteColorList> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorList> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
            onTap: () => setState(() {
              currentIndex = index;
              widget.note.color = kColors[index].value;
            }),
            child: ColorItems(
              isSelected: currentIndex == index,
              color: kColors[index],
            ),
          ),
        ),
      ),
    );
  }
}
