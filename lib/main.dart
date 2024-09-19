import 'package:bloc_clean_architecture_example/core/util/di/injection_container.dart';
import 'package:bloc_clean_architecture_example/presentation/post/screen/post_view.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/list/bloc/todo_bloc.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/list/screen/todo_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/resources/text.dart';

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
  int _selectedIndex = 0;
  final _screen = const [
    TodoView(),
    PostView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodoBloc()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: Scaffold(
          body: _screen[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.today_outlined),
                label: TText.bottomNavigationLabel1,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.article),
                label: TText.bottomNavigationLabel2,
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
