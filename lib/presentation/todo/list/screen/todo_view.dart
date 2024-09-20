import 'dart:async';

import 'package:bloc_clean_architecture_example/core/resources/text.dart';
import 'package:bloc_clean_architecture_example/core/widgets/app_widgets.dart';
import 'package:bloc_clean_architecture_example/data/model/todo/todo_model.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/list/bloc/todo_bloc.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/list/widgets/todo_floating_action_button.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/list/widgets/todo_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  /// Bloc
  late TodoBloc todoBloc;

  /// ScrollController
  final _scrollController = ScrollController();

  /// Model
  List<TodoModel> todoList = [];

  @override
  void initState() {
    todoBloc = BlocProvider.of<TodoBloc>(context);
    getTodo();
    super.initState();
  }

  @override
  void dispose() {
    /// Close Bloc
    todoBloc.close();

    /// Dispose ScrollController
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: const TodoFloatingActionButton(),
        appBar: AppBar(
          title: const Text(TText.todoViewAppBarTitle,
              style: TextStyle(
                color: Colors.green,
              )),
        ),
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            if (state is TodoLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetTodoSuccess) {
              todoList = state.data;
            } else if (state is DeleteTodoSuccess) {
              todoList.removeAt(state.index);
            } else if (state is UpdateTodoDone) {
              todoList.removeAt(state.index);
              todoList.insert(state.index, state.model);
            } else if (state is TodoFailure) {
              WidgetsBinding.instance.addPostFrameCallback(
                (_) => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AppWidgets.getErrorMessage(
                        context, state.errorMessage);
                  },
                ),
              );
            }
            return getBodyWidget();
          },
        ));
  }

  Widget getBodyWidget() {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          height: 5,
          color: Colors.black.withOpacity(0.1),
        );
      },
      itemCount: todoList.length,
      itemBuilder: (BuildContext context, int index) {
        return TodoListItem(
            index: index,
            model: todoList[index],
            scrollController: _scrollController,
            todoBloc: todoBloc);
      },
    );
  }

  Future<void> getTodo() async {
    todoBloc.add(const GetTodo());
  }
}
