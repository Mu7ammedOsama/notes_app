import 'package:flutter/material.dart';

// dependencies
import 'package:flutter_bloc/flutter_bloc.dart';

// cubits
import 'package:notes_app/cubits/addNotesCubit/addNoteCubit.dart';
import 'package:notes_app/cubits/notesCubit/noteCubit.dart';

// widgets
import 'package:notes_app/widgets/addNoteForm.dart';

class CustomModelBottomSheet extends StatelessWidget {
  const CustomModelBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNotesState>(
        listener: (context, state) {
          if (state is SuccessNote) {
            Navigator.pop(context);
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is LoadingNote ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: const SingleChildScrollView(
                child: AddNoteForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
