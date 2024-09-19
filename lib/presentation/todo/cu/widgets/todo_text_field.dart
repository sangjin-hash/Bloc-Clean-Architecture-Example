import 'package:bloc_clean_architecture_example/presentation/todo/cu/bloc/common/text_field/todo_text_field_cubit.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/cu/bloc/common/text_field/todo_text_field_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoTextField extends StatefulWidget {
  const TodoTextField(
      {super.key,
      required this.validatorText,
      this.inputFormatter,
      this.inputDecoration,
      required this.controller,
      this.onChanged});

  final String validatorText;
  final List<TextInputFormatter>? inputFormatter;
  final InputDecoration? inputDecoration;
  final TextEditingController controller;
  final void Function(String)? onChanged;

  @override
  State<TodoTextField> createState() => _TodoTextFieldState();
}

class _TodoTextFieldState extends State<TodoTextField> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoTextFieldCubit, TodoTextFieldState>(
        builder: (context, state) {
      return TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return widget.validatorText;
          }
          return null;
        },
        inputFormatters: widget.inputFormatter,
        decoration: widget.inputDecoration,
        controller: widget.controller,
        onChanged: widget.onChanged,
      );
    });
  }
}
