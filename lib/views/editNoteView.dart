import 'package:flutter/material.dart';

// models
import 'package:notes_app/models/noteModel.dart';

// widgets
import 'package:notes_app/widgets/editNoteViewBody.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) => EditNoteViewBody(note: note);
}
