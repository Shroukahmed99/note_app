import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/app/cubit/note_cubit.dart';
import 'package:todo_app/app/data/hive_data_storage.dart';

import 'app/screens/home/home_view.dart';

final RouteObserver routeObserver = RouteObserver<PageRoute>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('notes');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit()..fetchNotes(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo App',
        navigatorObservers: [routeObserver],
        themeMode: ThemeMode.system,
        home: const HomeView(),
      ),
    );
  }
}
