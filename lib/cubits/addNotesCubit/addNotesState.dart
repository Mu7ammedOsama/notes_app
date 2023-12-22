// parts
part of 'addNoteCubit.dart';

@immutable
abstract class AddNotesState {}

class InitialNotes extends AddNotesState {}

class LoadingNote extends AddNotesState {}

class SuccessNote extends AddNotesState {}

class FailureNote extends AddNotesState {
  final String errorMessage;

  FailureNote(this.errorMessage);
}
