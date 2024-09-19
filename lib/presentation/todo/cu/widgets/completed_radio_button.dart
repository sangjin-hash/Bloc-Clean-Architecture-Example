import 'package:bloc_clean_architecture_example/core/resources/enum_shop.dart';
import 'package:bloc_clean_architecture_example/core/resources/text.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/cu/bloc/common/radio_button/todo_radio_button_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompletedRadioButton extends StatefulWidget {
  const CompletedRadioButton({super.key, this.onChanged1, this.onChanged2});

  final void Function(RadioButtonOption?)? onChanged1;
  final void Function(RadioButtonOption?)? onChanged2;

  @override
  State<CompletedRadioButton> createState() => _CompletedRadioButtonState();
}

class _CompletedRadioButtonState extends State<CompletedRadioButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoRadioButtonCubit, RadioButtonOption?>(
      builder: (context, state) {
        return Column(
          children: [
            RadioListTile(
              title: const Text(TText.radioButtonText1),
              value: RadioButtonOption.yes,
              groupValue: state,
              onChanged: widget.onChanged1,
            ),
            RadioListTile(
              title: const Text(TText.radioButtonText2),
              value: RadioButtonOption.no,
              groupValue: state,
              onChanged: widget.onChanged2,
            ),
          ],
        );
      },
    );
  }
}
