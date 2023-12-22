import 'package:flutter/material.dart';

// dependencies
import 'package:flutter_bloc/flutter_bloc.dart';

// cubits
import 'package:notes_app/cubits/notesCubit/noteCubit.dart';

// widgets
import 'package:notes_app/widgets/customAppBar.dart';
import 'package:notes_app/widgets/customNotesListView.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 40),
            CustomAppBar(
              title: 'Notes',
              icon: Icons.search,
            ),
            Expanded(child: CustomNotesListView()),
          ],
        ),
      ),
    );
  }
}
