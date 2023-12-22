import 'package:flutter/material.dart';

// dependencies
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

// constants
import 'package:notes_app/constants.dart';

// models
import 'package:notes_app/models/noteModel.dart';

// parts
part 'addNotesState.dart';

class AddNoteCubit extends Cubit<AddNotesState> {
  AddNoteCubit() : super(InitialNotes());

  Color color = const Color(0xffAC3931);

  addNote(NoteModel note) async {
    note.color = color.value;
    emit(LoadingNote());

    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      emit(SuccessNote());
    } catch (e) {
      emit(FailureNote(e.toString()));
    }
  }
}
