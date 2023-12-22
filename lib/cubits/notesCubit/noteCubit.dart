import 'package:flutter/material.dart';

// dependencies
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

// constants
import 'package:notes_app/constants.dart';

// models
import 'package:notes_app/models/noteModel.dart';

// parts
part 'notesState.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(InitialNotes());

  List<NoteModel>? notes;

  fetchAllNotes() {
    Box<NoteModel> notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
    emit(SuccessNotes());
  }
}
