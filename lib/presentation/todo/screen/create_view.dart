import 'dart:async';

import 'package:bloc_clean_architecture_example/data/model/todo/todo_model.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/bloc/post_radiobutton_cubits/post_radio_button_cubit.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/bloc/post_textfield_cubit/post_textfield_cubit.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/widget1.dart';

class CreateView extends StatefulWidget {
  final TodoModel? model;

  const CreateView({super.key, required this.model});

  @override
  State<CreateView> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateView> {
  late bool updateWhether;
  final formKey = GlobalKey<FormState>();
  late TodoPostBloc todoPostBloc;
  int _id = 0;
  int _userId = 0;
  String _title = "";
  bool _completed = false;
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    todoPostBloc = BlocProvider.of<TodoPostBloc>(context);
    if (widget.model != null) {
      updateWhether = true;
      _id = widget.model!.id;
      _userId = widget.model!.userId;
      _title = widget.model!.title;
      _completed = widget.model!.completed;
      userIdController.text = '$_userId';
      idController.text = '$_id';
      titleController.text = _title;
    }
    updateWhether = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Please Create Your New Todolist",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: _bodyWidget(),
    );
  }

  Widget _bodyWidget() {
    return BlocConsumer<TodoPostBloc, PostTodoState>(
      builder: (context, state) {
        if (state is PostLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return _buildForm();
      },
      listener: (context, state) {
        if (state is PostSuccess) {
          Navigator.of(context).pop(state.data);
        } else if (state is PostFailure) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AppWidgets.getErrorMessage(context, state.errorMessage);
            },
          );
        }
      },
    );
  }

  ///
  Widget _buildForm() {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildUserIdField(),
            _buildIdField(),
            _buildTitleField(),
            _buildRadioButton(),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  /// userid textbuild
  Widget _buildUserIdField() {
    return BlocBuilder<PostTextFieldBloc, PostTextFieldState>(
        builder: (context, state) {
          return TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your userid';
              }
              return null;
            },
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(labelText: "User ID"),
            controller: userIdController,
            onChanged: (value) {
              _userId = int.parse(value);
              context.read<PostTextFieldBloc>().updateField1(value);
            },
          );
        });
  }

  /// id textbuild
  Widget _buildIdField() {
    return BlocBuilder<PostTextFieldBloc, PostTextFieldState>(
        builder: (context, state) {
          return TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your id';
              }
              return null;
            },
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(labelText: "ID"),
            controller: idController,
            onChanged: (value) {
              _id = int.parse(value);
              context.read<PostTextFieldBloc>().updateField2(value);
            },
          );
        });
  }

  /// id textbuild
  Widget _buildTitleField() {
    return BlocBuilder<PostTextFieldBloc, PostTextFieldState>(
        builder: (context, state) {
          return TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a title';
              }
              return null;
            },
            decoration: const InputDecoration(labelText: "Title"),
            controller: titleController,
            onChanged: (value) {
              _title = value;
              context.read<PostTextFieldBloc>().updateField3(value);
            },
          );
        });
  }

  Widget _buildRadioButton() {
    return BlocBuilder<PostRadioButtonCubit, RadioButtonOption?>(
      builder: (context, state) {
        return Column(
          children: [
            RadioListTile(
              title: const Text("Yes"),
              value: RadioButtonOption.yes,
              groupValue: state,
              onChanged: (value) {
                _completed = true;
                return context.read<PostRadioButtonCubit>().sayYesOrNO(value);
              },
            ),
            RadioListTile(
              title: const Text("No"),
              value: RadioButtonOption.no,
              groupValue: state,
              onChanged: (value) {
                _completed = false;
                return context.read<PostRadioButtonCubit>().sayYesOrNO(value);
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        {
          if (updateWhether = true) {
            if (formKey.currentState!.validate()) {
              final model = toRequestModel();
              todoUpdate(model,_id);
            }
          } else {
            if (formKey.currentState!.validate()) {
              final model = toRequestModel();
              todoRequest(model);
            }
            print('Enter all fields');
          }
        }
      },
      child: const Text("enter"),
    );
  }

  TodoModel toRequestModel() {
    return TodoModel(
        userId: _userId, id: _id, title: _title, completed: _completed);
  }

  Future<void> todoRequest(TodoModel model) async {
    todoPostBloc.add(PostTodoList(model));
  }

  Future<void> todoUpdate(TodoModel model, int id) async {
    todoPostBloc.add(PutTodoList(model,id) );
  }
}