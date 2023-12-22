import 'package:flutter/material.dart';

// dependencies
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// constants
import 'package:notes_app/constants.dart';

// cubits
import 'package:notes_app/cubits/notesCubit/noteCubit.dart';

// models
import 'package:notes_app/models/noteModel.dart';

// views
import 'package:notes_app/views/notesView.dart';

// bloc observer
import 'package:notes_app/simpleBlocObserver.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        home: const NotesView(),
      ),
    );
  }
}
