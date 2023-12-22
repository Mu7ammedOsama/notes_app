import 'package:flutter/material.dart';

// dependencies
import 'package:flutter_bloc/flutter_bloc.dart';

// cubits
import 'package:notes_app/cubits/notesCubit/noteCubit.dart';

// models
import 'package:notes_app/models/noteModel.dart';

// widgets
import 'package:notes_app/widgets/customAppBar.dart';
import 'package:notes_app/widgets/customTextFormField.dart';
import 'package:notes_app/widgets/editNoteColorList.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 40),
            CustomAppBar(
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.content = content ?? widget.note.content;
                widget.note.save();

                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
              title: 'Edit Note',
              icon: Icons.check,
            ),
            const SizedBox(height: 16),
            CustomFormTextField(
              hint: widget.note.title,
              onChanged: (value) => title = value,
            ),
            const SizedBox(height: 16),
            CustomFormTextField(
              hint: widget.note.content,
              onChanged: (value) => content = value,
              maxLines: 8,
            ),
            const SizedBox(height: 16),
            EditNoteColorList(note: widget.note),
          ],
        ),
      ),
    );
  }
}
