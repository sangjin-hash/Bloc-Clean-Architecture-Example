import 'dart:async';

import 'package:bloc_clean_architecture_example/core/resources/text.dart';
import 'package:bloc_clean_architecture_example/core/widgets/app_widgets.dart';
import 'package:bloc_clean_architecture_example/data/model/todo/todo_model.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/cu/bloc/common/radio_button/todo_radio_button_cubit.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/cu/bloc/common/text_field/todo_text_field_cubit.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/cu/bloc/create/create_todo_bloc.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/cu/bloc/update/update_todo_bloc.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/cu/widgets/completed_radio_button.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/cu/widgets/submit_button.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/cu/widgets/todo_text_field.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/list/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateUpdateView extends StatefulWidget {
  final int? index;
  final TodoModel? model;

  const CreateUpdateView({super.key, this.index, this.model});

  @override
  State<CreateUpdateView> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateUpdateView> {
  /// Bloc
  late TodoBloc todoBloc;
  late CreateTodoBloc createTodoBloc;
  late UpdateTodoBloc updateTodoBloc;
  late TodoTextFieldCubit todoTextFieldCubit;

  /// TextController
  final userIdController = TextEditingController();
  final idController = TextEditingController();
  final titleController = TextEditingController();

  /// CreateView or UpdateView flag
  late bool isUpdate;

  /// Data Fields
  late int _id;
  late int _userId;
  late String _title;
  bool _completed = true;

  @override
  void initState() {
    if (widget.model != null) {
      isUpdate = true;

      /// Initialize data fields
      _id = widget.model!.id;
      _userId = widget.model!.userId;
      _title = widget.model!.title;
      _completed = widget.model!.completed;

      /// Initialize TextController text
      userIdController.text = '$_userId';
      idController.text = '$_id';
      titleController.text = _title;

      updateTodoBloc = BlocProvider.of<UpdateTodoBloc>(context);
    } else {
      isUpdate = false;
      createTodoBloc = BlocProvider.of<CreateTodoBloc>(context);
    }
    todoBloc = BlocProvider.of<TodoBloc>(context);
    todoTextFieldCubit = BlocProvider.of<TodoTextFieldCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
    /// Close Bloc or Cubit
    isUpdate ? updateTodoBloc.close() : createTodoBloc.close();
    todoTextFieldCubit.close();

    /// Dispose TextController
    userIdController.dispose();
    idController.dispose();
    titleController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          TText.cuViewAppBarTitle,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: isUpdate
          ? BlocConsumer<UpdateTodoBloc, UpdateTodoState>(
              builder: (context, state) {
                if (state is UpdateTodoLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return getBodyWidget();
              },
              listener: (context, state) {
                if (state is UpdateTodoSuccess) {
                  updateTodoCompleted(state.index, state.data);
                  Navigator.of(context).pop();
                } else if (state is UpdateTodoFailure) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AppWidgets.getErrorMessage(
                          context, state.errorMessage);
                    },
                  );
                }
              },
            )
          : BlocConsumer<CreateTodoBloc, CreateTodoState>(
              builder: (context, state) {
                if (state is CreateTodoLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return getBodyWidget();
              },
              listener: (context, state) {
                if (state is CreateTodoSuccess) {
                  // todo : Update 했던 것처럼 추가해보기
                  Navigator.of(context).pop();
                } else if (state is CreateTodoFailure) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AppWidgets.getErrorMessage(
                          context, state.errorMessage);
                    },
                  );
                }
              },
            ),
    );
  }

  Widget getBodyWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// UserId TextField
        TodoTextField(
          validatorText: TText.validatorText1,
          inputFormatter: [FilteringTextInputFormatter.digitsOnly],
          inputDecoration: const InputDecoration(labelText: TText.labelText1),
          controller: userIdController,
          onChanged: (value) {
            _userId = int.parse(value);
            context.read<TodoTextFieldCubit>().updateField1(value);
          },
        ),
        const SizedBox(height: 5),

        /// Id TextField
        TodoTextField(
          validatorText: TText.validatorText2,
          inputFormatter: [FilteringTextInputFormatter.digitsOnly],
          inputDecoration: const InputDecoration(labelText: TText.labelText2),
          controller: idController,
          onChanged: (value) {
            _id = int.parse(value);
            context.read<TodoTextFieldCubit>().updateField2(value);
          },
        ),
        const SizedBox(height: 5),

        /// Title TextField
        TodoTextField(
          validatorText: TText.validatorText3,
          inputDecoration: const InputDecoration(labelText: TText.labelText3),
          controller: titleController,
          onChanged: (value) {
            _title = value;
            context.read<TodoTextFieldCubit>().updateField3(value);
          },
        ),
        const SizedBox(height: 5),

        /// RadioButton
        CompletedRadioButton(
          onChanged1: (value) {
            _completed = true;
            return context.read<TodoRadioButtonCubit>().isCompleted(value);
          },
          onChanged2: (value) {
            _completed = false;
            return context.read<TodoRadioButtonCubit>().isCompleted(value);
          },
        ),
        const SizedBox(height: 5),

        /// Submit Button
        SubmitButton(onPressed: () {
          if (_isNotEmpty()) {
            isUpdate
                ? updateTodo(
                    id: _id, index: widget.index!, model: toRequestModel())
                : createTodo(toRequestModel());
          }
        })
      ],
    );
  }

  bool _isNotEmpty() {
    return userIdController.text.isNotEmpty &&
        idController.text.isNotEmpty &&
        titleController.text.isNotEmpty;
  }

  TodoModel toRequestModel() {
    return TodoModel(
        userId: _userId, id: _id, title: _title, completed: _completed);
  }

  Future<void> createTodo(TodoModel model) async {
    createTodoBloc.add(CreateTodo(model));
  }

  Future<void> updateTodo(
      {required int id, required int index, required TodoModel model}) async {
    updateTodoBloc.add(UpdateTodo(id: id, index: index, model: model));
  }

  Future<void> updateTodoCompleted(int index, TodoModel model) async {
    todoBloc.add(UpdateTodoCompleted(index, model));
  }
}
