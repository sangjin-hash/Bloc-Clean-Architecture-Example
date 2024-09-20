import 'package:bloc_clean_architecture_example/core/util/di/injection_container.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/list/bloc/todo_bloc.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/list/screen/todo_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupLocator();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: const Scaffold(body: TodoView()),
      ),
    );
  }
}
