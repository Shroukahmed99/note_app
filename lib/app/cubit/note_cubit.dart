import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/app/data/hive_data_storage.dart';

class NoteCubit extends Cubit<List<NoteModel>> {
  NoteCubit() : super([]);

  final Box<NoteModel> _noteBox = Hive.box<NoteModel>('notes');

  void fetchNotes() {
    emit(_noteBox.values.toList());
  }

  void addNote(NoteModel note) {
    _noteBox.add(note);
    fetchNotes();
  }

  void updateNote(int index, NoteModel updatedNote) {
    _noteBox.putAt(index, updatedNote);
    fetchNotes();
  }

  void deleteAllNotes() {
    _noteBox.clear();
    fetchNotes();
  }
}
