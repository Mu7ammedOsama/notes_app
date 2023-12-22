import 'package:flutter/material.dart';

// dependencies
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// cubits
import 'package:notes_app/cubits/addNotesCubit/addNoteCubit.dart';

// models
import 'package:notes_app/models/noteModel.dart';

// widgets
import 'package:notes_app/widgets/customTextFormField.dart';
import 'package:notes_app/widgets/customButton.dart';
import 'package:notes_app/widgets/colorsListView.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 32),
          CustomFormTextField(
            hint: 'Title....',
            onSaved: (value) => title = value,
          ),
          const SizedBox(height: 16),
          CustomFormTextField(
            hint: 'Content....',
            onSaved: (value) => content = value,
            maxLines: 8,
          ),
          const SizedBox(height: 16),
          const ColorListView(),
          const SizedBox(height: 16),
          BlocBuilder<AddNoteCubit, AddNotesState>(
            builder: (context, state) => CustomButton(
              isLoading: state is LoadingNote ? true : false,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();

                  DateTime currentDate = DateTime.now();
                  String formattedCurrentDate = DateFormat('dd-MM-yyyy').format(currentDate);

                  var noteModel = NoteModel(
                    title: title!,
                    content: content!,
                    date: formattedCurrentDate,
                    color: Colors.blue.value,
                  );
                  BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                } else {
                  setState(() => autovalidateMode = AutovalidateMode.always);
                }
              },
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
