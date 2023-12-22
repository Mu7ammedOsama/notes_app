import 'package:flutter/material.dart';

// dependencies
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// cubits
import 'package:notes_app/cubits/notesCubit/noteCubit.dart';

// models
import 'package:notes_app/models/noteModel.dart';

// widgets
import 'package:notes_app/views/editNoteView.dart';

class CustomNotesItem extends StatelessWidget {
  const CustomNotesItem({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditNoteView(note: note),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                note.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  note.content,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 16,
                  ),
                ),
              ),
              trailing: IconButton(
                icon: const Icon(FontAwesomeIcons.trash),
                color: Colors.black,
                onPressed: () {
                  note.delete();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
              ),
            ),
            Text(
              note.date,
              style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
