import 'package:dictionary/functions/list_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum RadioValue { startWith, contains, endsWith }

class RadioButton extends StatelessWidget {
  final String radioButtonText;
  final RadioValue value;
  final Color color;
  const RadioButton({
    super.key,
    required this.radioButtonText,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RadioListTile(
        title: Text(
          radioButtonText,
        ),
        value: value,
        groupValue: selectedRadioValue.value,
        onChanged: (value) {
          selectedRadioValue.value = value!;
          color == Colors.blue ? englishWordsList() : malayalamWordsList();
        },
      ),
    );
  }
}
