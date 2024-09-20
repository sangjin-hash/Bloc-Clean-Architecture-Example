import 'package:bloc_clean_architecture_example/core/resources/enum_shop.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/cu/bloc/common/radio_button/todo_radio_button_cubit.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/cu/bloc/common/text_field/todo_text_field_cubit.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/cu/bloc/create/create_todo_bloc.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/cu/screen/create_update_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoFloatingActionButton extends StatelessWidget {
  const TodoFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        RadioButtonOption initial = RadioButtonOption.yes;

        /// Navigate to CreateView
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => MultiBlocProvider(providers: [
              BlocProvider(create: (context) => TodoRadioButtonCubit(initial)),
              BlocProvider(create: (context) => TodoTextFieldCubit()),
              BlocProvider(create: (context) => CreateTodoBloc()),
            ], child: const CreateUpdateView(entity: null)),
          ),
        );
      },
      child: const Icon(
        Icons.create_new_folder,
      ),
    );
  }
}
