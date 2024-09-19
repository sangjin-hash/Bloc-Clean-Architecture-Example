import 'dart:async';

import 'package:bloc_clean_architecture_example/data/model/todo/todo_model.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/bloc/todo_bloc.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/screen/create_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../bloc/post_radiobutton_cubits/post_radio_button_cubit.dart';
import '../widgets/widget1.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  List<TodoModel> todoList = [];
  late TodoListBloc todoListBloc;
  late DeleteTodoBloc deleteTodoBloc;
  final ScrollController _scrollController = ScrollController();
  late TodoModel nowModel;

  @override
  void initState() {
    todoListBloc = BlocProvider.of<TodoListBloc>(context);
    deleteTodoBloc = BlocProvider.of<DeleteTodoBloc>(context);
    getTodo();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        ///추가버튼
        floatingActionButton: _getFloatingButton(),
        appBar: AppBar(
          title: const Text("ListViewer",
              style: TextStyle(
                color: Colors.green,
              )),
        ),
        body: _getBodyWidget());
  }

  Widget _getFloatingButton() {
    return FloatingActionButton(
      onPressed: () async {
        RadioButtonOption initial = RadioButtonOption.yes;
        final result = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
                create: (context) => PostRadioButtonCubit(initial),
                child: CreateView(model: null)),
          ),
        );
        if (result != null) {
          setState(() {
            todoList.add(result);
          });
          debugPrint('[TodoList] todoList.length = ${todoList.length}');
        }
      },
      child: const Icon(
        Icons.create_new_folder,
      ),
    );
  }

  Widget _getBodyWidget() {
    return BlocBuilder<TodoListBloc, TodoListState>(
      builder: (context, state) {
        if (state is TodoListLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TodoListSuccess) {
          if (todoList.isEmpty) {
            todoList.addAll(state.data);
          }
        } else if (state is TodoListError) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => showDialog(
              context: context,
              builder: (BuildContext context) {
                return AppWidgets.getErrorMessage(context, state.errorMessage);
              },
            ),
          );
        }
        return _buildTodoList();
      },
    );
  }

  Widget _buildTodoList() {
    double screenWidth = MediaQuery.of(context).size.width;
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          height: 5,
          color: Colors.black.withOpacity(0.1),
        );
      },
      itemCount: todoList.length,
      itemBuilder: (BuildContext context, int index) {
        int userId = todoList[index].userId;
        int id = todoList[index].id;
        String title = todoList[index].title;
        bool completed = todoList[index].completed;

        return Container(
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  width: screenWidth,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("User ID : $userId"), Text("ID : $id")],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              "Title : $title",
                              maxLines: 2,
                            ),
                          ),
                          Container(child: getCompleted(completed)),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 80,
                  child: ElevatedButton(
                      onPressed: () async {
                        final TodoModel nowModel = TodoModel(
                            userId: userId,
                            id: id,
                            title: title,
                            completed: completed);
                        _scrollToFirst();
                        final RadioButtonOption initial = completed
                            ? RadioButtonOption.yes
                            : RadioButtonOption.no;
                        final result = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                                create: (context) =>
                                    PostRadioButtonCubit(initial),
                                child: CreateView(model: nowModel)),
                          ),
                        );
                        if (result != null) {
                          deleteTodo(id);
                          setState(() {
                            todoList.removeAt(index);
                            todoList.insert(index, result);
                          });
                          debugPrint(
                              '[TodoList] todoList.length = ${todoList.length}');
                        }
                      },
                      child: const Icon(Icons.edit)),
                ),
                SizedBox(
                  width: 80,
                  child: ElevatedButton(
                    onPressed: () {
                      deleteTodo(id);
                      _scrollToFirst();
                      setState(() {
                        todoList.removeAt(index);
                      });
                    },
                    /////
                    child: const Icon(Icons.delete_outline),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget getCompleted(completed) {
    if (completed == true) {
      return SvgPicture.asset(
        "assets/svg/heart_on.svg",
        width: 30,
        height: 30,
      );
    } else {
      return SvgPicture.asset(
        "assets/svg/heart_off.svg",
        width: 30,
        height: 30,
      );
    }
  }

  Future<void> deleteTodo(int id) async {
    deleteTodoBloc.add(DeleteTodo(id));
  }

  Future<void> getTodo() async {
    todoListBloc.add(const GetTodoList());
  }

  void _scrollToFirst() {
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
