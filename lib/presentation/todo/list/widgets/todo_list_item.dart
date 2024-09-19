import 'package:bloc_clean_architecture_example/core/resources/enum_shop.dart';
import 'package:bloc_clean_architecture_example/core/resources/text.dart';
import 'package:bloc_clean_architecture_example/data/model/todo/todo_model.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/cu/bloc/common/radio_button/todo_radio_button_cubit.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/cu/bloc/common/text_field/todo_text_field_cubit.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/cu/bloc/update/update_todo_bloc.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/cu/screen/create_update_view.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/list/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem(
      {super.key,
      required this.index,
      required this.model,
      required this.scrollController,
      required this.todoBloc});

  final int index;
  final TodoModel model;
  final ScrollController scrollController;
  final TodoBloc todoBloc;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(
            width: screenWidth,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${TText.userIdText}${model.userId}"),
                    Text("${TText.idText}${model.id}")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        "${TText.titleText}${model.title}",
                        maxLines: 2,
                      ),
                    ),
                    Container(child: _getCompleted(model.completed)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 80,
            child: ElevatedButton(
                onPressed: () async {
                  _scrollToFirst();
                  final RadioButtonOption initial = model.completed
                      ? RadioButtonOption.yes
                      : RadioButtonOption.no;

                  /// Navigate to UpdateView
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          MultiBlocProvider(providers: [
                        BlocProvider(
                            create: (context) => TodoRadioButtonCubit(initial)),
                        BlocProvider(create: (context) => TodoTextFieldCubit()),
                        BlocProvider(create: (context) => UpdateTodoBloc()),
                      ], child: CreateUpdateView(model: model)),
                    ),
                  );
                },
                child: const Icon(Icons.edit)),
          ),
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {
                deleteTodo(id: model.id, index: index);
                _scrollToFirst();
              },
              /////
              child: const Icon(Icons.delete_outline),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getCompleted(completed) {
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

  void _scrollToFirst() {
    scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  Future<void> deleteTodo({required int id, required int index}) async {
    todoBloc.add(DeleteTodo(id: id, index: index));
  }
}
