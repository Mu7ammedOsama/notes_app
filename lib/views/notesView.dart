import 'package:flutter/material.dart';

// constants
import 'package:notes_app/constants.dart';

// widgets
import 'package:notes_app/widgets/notesViewBody.dart';
import 'package:notes_app/widgets/customModelBottomSheet.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: const NotesViewBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () => showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          context: context,
          builder: (context) => const CustomModelBottomSheet(),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
