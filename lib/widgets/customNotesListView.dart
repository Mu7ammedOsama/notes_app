import 'package:flutter/material.dart';

// dependencies
import 'package:flutter_bloc/flutter_bloc.dart';

// cubits
import 'package:notes_app/cubits/notesCubit/noteCubit.dart';

// models
import 'package:notes_app/models/noteModel.dart';

// widgets
import 'package:notes_app/widgets/customNotesItem.dart';

class CustomNotesListView extends StatelessWidget {
  const CustomNotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notesList = BlocProvider.of<NotesCubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ListView.builder(
            itemCount: notesList.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CustomNotesItem(note: notesList[index]),
            ),
          ),
        );
      },
    );
  }
}
