import 'dart:async';

import 'package:bloc_clean_architecture_example/core/resources/text.dart';
import 'package:bloc_clean_architecture_example/core/widgets/app_widgets.dart';
import 'package:bloc_clean_architecture_example/domain/entity/todo.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/cu/bloc/common/radio_button/todo_radio_button_cubit.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/cu/bloc/common/text_field/todo_text_field_cubit.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/cu/bloc/create/create_todo_bloc.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/cu/bloc/update/update_todo_bloc.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/cu/widgets/completed_radio_button.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/cu/widgets/submit_button.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/cu/widgets/todo_text_field.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/list/bloc/todo_bloc.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/param/todo_param.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateUpdateView extends StatefulWidget {
  final int? index;
  final Todo? entity;

  const CreateUpdateView({super.key, this.index, this.entity});

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

  /// Data Field => Param
  TodoParam param = TodoParam();

  @override
  void initState() {
    if (widget.entity != null) {
      isUpdate = true;

      /// Initialize data fields
      param.id = widget.entity!.id;
      param.userId = widget.entity!.userId;
      param.title = widget.entity!.title;
      param.completed = widget.entity!.completed;

      /// Initialize TextController text
      userIdController.text = '${param.userId!}';
      idController.text = '${param.id!}';
      titleController.text = param.title!;

      updateTodoBloc = BlocProvider.of<UpdateTodoBloc>(context);
    } else {
      isUpdate = false;
      param.completed = true;
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
                  updateTodoCompleted(state.index, state.entity);
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
                  createTodoCompleted(state.entity);
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
            param.userId = int.parse(value);
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
            param.id = int.parse(value);
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
            param.title = value;
            context.read<TodoTextFieldCubit>().updateField3(value);
          },
        ),
        const SizedBox(height: 5),

        /// RadioButton
        CompletedRadioButton(
          onChanged1: (value) {
            param.completed = true;
            return context.read<TodoRadioButtonCubit>().isCompleted(value);
          },
          onChanged2: (value) {
            param.completed = false;
            return context.read<TodoRadioButtonCubit>().isCompleted(value);
          },
        ),
        const SizedBox(height: 5),

        /// Submit Button
        SubmitButton(onPressed: () {
          if (_isNotEmpty()) {
            isUpdate
                ? updateTodo(
                    id: param.id!, index: widget.index!, param: param)
                : createTodo(param);
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

  Future<void> createTodo(TodoParam param) async {
    createTodoBloc.add(CreateTodo(param));
  }

  Future<void> updateTodo(
      {required int id,
      required int index,
      required TodoParam param}) async {
    updateTodoBloc.add(UpdateTodo(id: id, index: index, param: param));
  }

  Future<void> updateTodoCompleted(int index, Todo entity) async {
    todoBloc.add(UpdateTodoCompleted(index, entity));
  }

  Future<void> createTodoCompleted(Todo entity) async {
    todoBloc.add(CreateTodoCompleted(entity));
  }
}
